set -x
~/miniforge3/envs/DeepKNLP/bin/python -m deepspeed.launcher.runner --include=localhost:0,1,2,3 --master_port 30000 task2-nerG-trainer2.py --run_version EAGLE-1B-debug-ds --trainer_deepspeed configs/deepspeed/ds0_llama.json
~/miniforge3/envs/DeepKNLP/bin/python -m deepspeed.launcher.runner --include=localhost:0,1,2,3 --master_port 30000 task2-nerG-trainer2.py --run_version EAGLE-1B-debug-ds --trainer_deepspeed configs/deepspeed/ds1_llama.json
~/miniforge3/envs/DeepKNLP/bin/python -m deepspeed.launcher.runner --include=localhost:0,1,2,3 --master_port 30000 task2-nerG-trainer2.py --run_version EAGLE-1B-debug-ds --trainer_deepspeed configs/deepspeed/ds2_llama.json
~/miniforge3/envs/DeepKNLP/bin/python -m deepspeed.launcher.runner --include=localhost:0,1,2,3 --master_port 30000 task2-nerG-trainer2.py --run_version EAGLE-1B-debug-ds --trainer_deepspeed configs/deepspeed/ds3_llama.json
#~/miniforge3/envs/DeepKNLP/bin/python -m accelerate.commands.launch --config_file configs/accelerate/gpu4A-ds0.yaml task2-nerG-trainer2.py --run_version EAGLE-1B-debug-ac --accelerate_deepspeed
#~/miniforge3/envs/DeepKNLP/bin/python -m accelerate.commands.launch --config_file configs/accelerate/gpu4A-ds1.yaml task2-nerG-trainer2.py --run_version EAGLE-1B-debug-ac --accelerate_deepspeed
#~/miniforge3/envs/DeepKNLP/bin/python -m accelerate.commands.launch --config_file configs/accelerate/gpu4A-ds2.yaml task2-nerG-trainer2.py --run_version EAGLE-1B-debug-ac --accelerate_deepspeed
#~/miniforge3/envs/DeepKNLP/bin/python -m accelerate.commands.launch --config_file configs/accelerate/gpu4A-ds3.yaml task2-nerG-trainer2.py --run_version EAGLE-1B-debug-ac --accelerate_deepspeed
