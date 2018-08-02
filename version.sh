#!/bin/bash

get_next_version () {
    GITDESCRIPTION=$2
    GITDESCRIPTION=${GITDESCRIPTION,,}
    CURRENTTAG=$1

    MAJOR=$(echo "$CURRENTTAG" | cut -d'.' -f 1)
    
    MINOR=$(echo "$CURRENTTAG" | cut -d'.' -f 2)
    
    PATCH=$(echo "$CURRENTTAG" | cut -d'.' -f 3)
    
    if [[ $GITDESCRIPTION = *"patch"* || $GITDESCRIPTION = *":fire:"* || $GITDESCRIPTION = *":bug:"* || $GITDESCRIPTION = *":poop:"* ]]; then
        PATCH=$(($PATCH + 1))
        echo "$MAJOR.$MINOR.$PATCH"
    else
        if [[ $GITDESCRIPTION = *"minor"* || $GITDESCRIPTION = *":tada:"* ]]; then
                MINOR=$(($MINOR + 1))
                echo "$MAJOR.$MINOR.0"  
        else   
            if [[ $GITDESCRIPTION = *"major"* || $GITDESCRIPTION = *":boom:"* ]]; then
                MAJOR=$(($MAJOR + 1))
                echo "$MAJOR.0.0"
            else 
                echo "error"
                exit 1
            fi    
        fi
    fi
   
}

"$@"
