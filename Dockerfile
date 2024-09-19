FROM nvidia/cuda:12.4.1-devel-ubuntu22.04

RUN apt update && apt install -y git pip && apt clean all
RUN pip install langchain-community langchain-core langchain streamlit streamlit_chat chromadb pypdf fastembed && pip3 cache purge

RUN git clone https://github.com/twobombs/local-rag-example
RUN cd /local-rag-example && chmod 755 run.sh

ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES graphics,utility,compute

EXPOSE 8501
ENTRYPOINT /local-rag-example/run.sh
