#!/bin/sh

SCRIPTDIR=$(exec 2>/dev/null;cd -- $(dirname "$0"); unset PWD; /usr/bin/pwd || /bin/pwd || pwd)

CALICAM_EXE="${SCRIPTDIR}/../calicam/run.py"
OUTPUT_DIR="${SCRIPTDIR}/../assets/results"

CAMERAS=("CANON EOS D80" "IPHONE X" "NIKON D100")

IFS=""

for camera in "${CAMERAS[@]}"
do
    background_image="${SCRIPTDIR}/${camera}/object.jpeg"

    dir="${SCRIPTDIR}/${camera}/"
    output_dir="${OUTPUT_DIR}/${camera}"

    cal_points="${dir}/calibration.csv"
    data_points="${dir}/points.csv"
    graph_title="${camera}"
    log_path="${output_dir}/output.txt"
    output_path="${output_dir}/graph.png"

    echo "\nProcessing $dir\n"

    mkdir -p "${output_dir}"

    eval "\${CALICAM_EXE} \${cal_points} --data \${data_points} --graph \${background_image} --title \${graph_title} --out \${output_path} > \${log_path}"
done
