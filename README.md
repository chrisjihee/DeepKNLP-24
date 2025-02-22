# DeepKNLP
Transformer-based Korean Natural Language Processing

## Main Reference
![overview](images/overview.png?raw=true)
* ratsgo ratsnlp: https://github.com/ratsgo/ratsnlp
* ratsgo nlpbook: https://ratsgo.github.io/nlpbook/
* HF Transformers: https://github.com/huggingface/transformers
* Lightning Fabric: https://lightning.ai/docs/fabric/stable/

## Installation

1. Install Miniforge
    ```bash
    wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
    bash Miniforge3-$(uname)-$(uname -m).sh
    ```
2. Clone the repository
    ```bash
    rm -rf DeepKNLP*; git clone https://github.com/chrisjihee/DeepKNLP-24.git; cd DeepKNLP*;
    ```
3. Create a new environment
    ```bash
    conda search conda -c conda-forge
    conda install -n base -c conda-forge conda=25.1.1 -y;
    conda create -n DeepKNLP python=3.12 -y; conda activate DeepKNLP
    conda install cuda-libraries=11.8 cuda-libraries-dev=11.8 cuda-cudart=11.8 cuda-cudart-dev=11.8 \
                  cuda-nvrtc=11.8 cuda-nvrtc-dev=11.8 cuda-driver-dev=11.8 \
                  cuda-nvcc=11.8 cuda-cccl=11.8 cuda-runtime=11.8 cuda-version=11.8 \
                  libcusparse=11 libcusparse-dev=11 libcublas=11 libcublas-dev=11 \
                  -c nvidia -c pytorch -y
    pip list; echo ==========; conda --version; echo ==========; conda list
    ```
4. Install the required packages
    ```bash
    pip install -r requirements.txt
    export CUDA_HOME=""; DS_BUILD_FUSED_ADAM=1 pip install --no-cache deepspeed; ds_report
    MAX_JOBS=40 pip install --no-cache --no-build-isolation --upgrade flash-attn;  # for Micorsoft's Phi models
    rm -rf transformers; git clone https://github.com/chrisjihee/transformers.git; pip install -U -e transformers
    rm -rf chrisbase;    git clone https://github.com/chrisjihee/chrisbase.git;    pip install -U -e chrisbase 
    rm -rf chrisdata;    git clone https://github.com/chrisjihee/chrisdata.git;    pip install -U -e chrisdata
    rm -rf progiter;     git clone https://github.com/chrisjihee/progiter.git;     pip install -U -e progiter
    pip list | grep -E "torch|lightn|trans|accel|speed|flash|numpy|piece|chris|prog|pydantic"
    ```
5. Unzip some archived data
    ```bash
    cd data/gner; tar zxf united.tar.gz; cd ../..;
    cd data/gner; tar zxf each-BL.tar.gz; tar zxf sampled-each-BL.tar.gz; cd ../..;
    cd data/gner; tar zxf each-WQ=1.tar.gz; tar zxf sampled-each-WQ=1.tar.gz; cd ../..;
    cd data/gner; tar zxf each-WQ=3.tar.gz; tar zxf sampled-each-WQ=3.tar.gz; cd ../..;
    cd data/gner; tar zxf each-WQ=5.tar.gz; tar zxf sampled-each-WQ=5.tar.gz; cd ../..;
    ```
6. Login to Hugging Face and link the cache
    ```bash
    huggingface-cli whoami
    huggingface-cli login
    ln -s ~/.cache/huggingface ./.cache_hf
    ```

## Target Task
* Document Classification: https://ratsgo.github.io/nlpbook/docs/doc_cls/overview/
  - `python task1-cls.py --help`
  - `python task1-cls.py train --help`
  - `python task1-cls.py test --help`
  - `python task1-cls.py serve --help`
* Word Sequence Labelling: https://ratsgo.github.io/nlpbook/docs/ner/overview/
  - `python task2-ner.py --help`
  - `python task2-ner.py train --help`
  - `python task2-ner.py test --help`
  - `python task2-ner.py serve --help`
* Word Sequence Labelling (GenerativeNER) [no-trainer]:
  - `python task2-nerG-no-trainer.py --help`
  - `python task2-nerG-no-trainer.py train --help`
* Word Sequence Labelling (GenerativeNER) [trainer]:
  - `python task2-nerG-trainer.py --help`
  - `python scripts/run-task2-nerG-trainer-BL.py`
  - `python scripts/run-task2-nerG-trainer-WQ.py`
* [Not Yet Provided] Sentence Pair Classification: https://ratsgo.github.io/nlpbook/docs/pair_cls/overview/
* [Not Yet Provided] Extractive Question Answering: https://ratsgo.github.io/nlpbook/docs/qa/overview/
