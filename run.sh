#!/bin/bash

BLUE='\033[0;36m'
NC='\033[0m'

IMAGE_NAME="cub3d-env"

# Build docker image if not build yet
if [[ "$(sudo docker images -q $IMAGE_NAME 2> /dev/null)" == "" ]]; then
    echo -e "${BLUE}Creating Cub3D development environment...${NC}"
    sudo docker build -t $IMAGE_NAME .

    # Exit if Docker fails
    if [[ $? -ne 0 ]]; then
        exit 1
    fi
fi

# Authorize X11
xhost +local:docker > /dev/null

# User input loop
while true; do

    MAPS_DIR="assets/maps"
    MAPS=($(ls $MAPS_DIR/*.cub 2> /dev/null))

    if [ ${#MAPS[@]} -eq 0 ]; then
        echo "No maps found in $MAPS_DIR"
        exit 1
    fi

    echo -e "${BLUE}\n--- Cub3D Map Selector ---${NC}"
    for i in "${!MAPS[@]}"; do
        printf "  [%d] %s\n" "$i" "${MAPS[$i]##*/}"
    done

    # Read user choice
    echo -en "\nPress ${BLUE}q${NC} to exit"
    echo -en "\nChoose a map number: ${BLUE}"
    read index
    echo -e "${NC}"

    # If 'q' exit loop
    if [[ "$index" == "q" ]]; then
        break
    fi
    # Invalid number
    if [[ ! "$index" =~ ^[0-9]+$ ]] || [[ -z "${MAPS[$index]}" ]]; then
        echo -e "${BLUE}Invalid choice. Please enter a number from the list.${NC}"
        sleep 2
    # Valid number
    else
        SELECTED_MAP=${MAPS[$index]}
        clear
        echo -e "${BLUE}Compiling and launching Cub3D...${NC}"
        # Execute Docker
        sudo docker run -it --rm \
            -e DISPLAY=$DISPLAY \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v $(pwd):/app \
            --device /dev/snd \
            $IMAGE_NAME \
            sh -c "chmod +x libraries/minilibx-linux/configure && make bonus && ./cub3D $SELECTED_MAP"
    fi
done