# Use an official Python runtime as a parent image
FROM python:3.9

# Set the working directory in the container
WORKDIR /usr/src/app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Install conda
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda \
    && rm Miniconda3-latest-Linux-x86_64.sh

# Update PATH environment variable
ENV PATH=/opt/conda/bin:$PATH

# Install required Python packages using conda and pip
RUN conda install -y \
    pandas=1.4.2 \
    matplotlib=3.5.1 \
    scikit-learn=1.0.2 \
    seaborn=0.11.2 \
    statsmodels=0.13.2 \
    jupyter \
    && conda clean -a

RUN pip install numpy==1.23.1 \
    keras==2.9.0 \
    tensorflow==2.9.1 \
    joblib

# Expose port for Jupyter Notebook
EXPOSE 8888

# Command to run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]
