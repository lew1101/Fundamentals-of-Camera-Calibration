#!/bin/sh

SCRIPTDIR=$(exec 2>/dev/null;cd -- $(dirname "$0"); unset PWD; /usr/bin/pwd || /bin/pwd || pwd)

CALICAM_EXE="${SCRIPTDIR}/../calicam/run.py"
OUTPUT_DIR="${SCRIPTDIR}/../assets/results"

CAMERAS=("CANNON D80" "IPHONE X" "NIKON D100")
SUBDIRS=("SPREAD" "CENTRE")

IFS=""

for camera in "${CAMERAS[@]}"
do
    background_image="${SCRIPTDIR}/${camera}/object.jpeg"

    for subdir in "${SUBDIRS[@]}"
    do
        dir="${SCRIPTDIR}/${camera}/${subdir}"
        output_dir="${OUTPUT_DIR}/${camera}/${subdir}"

        cal_points="${dir}/calibration.csv"
        data_points="${dir}/points.csv"
        graph_title="${camera} - ${subdir}"
        log_path="${output_dir}/output.txt"
        output_path="${output_dir}/graph.png"

        echo "\nProcessing $dir\n"

        mkdir -p "${output_dir}"

        eval "\${CALICAM_EXE}" "\${cal_points}" --noprint --data "\${data_points}" --graph "\${background_image}" --title "\${graph_title}" --log "\${log_path}" --out "\${output_path}"
    done
done
