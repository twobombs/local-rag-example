FROM nvidia/cuda:12.4.1-devel-ubuntu22.04

RUN apt install -y python3 pip && apt clean all
RUN pip install langchain streamlit streamlit_chat chromadb pypdf fastembed && pip3 cache purge

RUN git clone https://github.com/twobombs/local-rag-example
RUN cd /local-rag-example && chmod 755run.sh

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute
ENTRYPOINT /local-rag-example/run.sh
