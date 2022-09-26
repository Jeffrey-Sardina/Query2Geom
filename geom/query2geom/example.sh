#!/bin/bash

# to run Query2Geom, use --offset_deepsets min --center_deepsets mean
# to run Query2box, use --offset_deepsets inductive --center_deepsets elattention 

 CUDA_VISIBLE_DEVICES=0 python -u codes/run.py --do_train --cuda --do_valid --do_test \
  --data_path data/FB15k-237 --model BoxTransE -n 128 -b 512 -d 400 -g 24 -a 1.0 \
  -lr 0.0001 --max_steps 300000 --cpu_num 1 --test_batch_size 16 --center_reg 0.02 \
  --geo box --task 1c.2c.3c.2i.3i.ic.ci.2u.uc --stepsforpath 300000  --offset_deepsets min --center_deepsets mean \
  --print_on_screen &> log.geom.fb15k237.temp

CUDA_VISIBLE_DEVICES=0 python -u codes/run.py --do_train --cuda --do_valid --do_test \
  --data_path data/FB15k --model BoxTransE -n 128 -b 512 -d 400 -g 24 -a 1.0 \
  -lr 0.0001 --max_steps 300000 --cpu_num 1 --test_batch_size 16 --center_reg 0.02 \
  --geo box --task 1c.2c.3c.2i.3i.ic.ci.2u.uc --stepsforpath 300000  --offset_deepsets min --center_deepsets mean \
  --print_on_screen &> log.geom.fb15k.temp

CUDA_VISIBLE_DEVICES=0 python -u codes/run.py --do_train --cuda --do_valid --do_test \
  --data_path data/NELL --model BoxTransE -n 128 -b 512 -d 400 -g 24 -a 1.0 \
  -lr 0.0001 --max_steps 300000 --cpu_num 1 --test_batch_size 16 --center_reg 0.02 \
  --geo box --task 1c.2c.3c.2i.3i.ic.ci.2u.uc --stepsforpath 300000  --offset_deepsets min --center_deepsets mean \
  --print_on_screen &> log.geom.nell.temp

