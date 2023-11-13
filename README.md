# Chat with your Data (cwd) Benchmark Data

## Introduction 

This repository contains the data and metadata for the "Chat with your Data" benchmark. The aim of this project is to provide a comprehensive set of test scenarios for Language-to-query (specifically SQL and SPARQL) systems. 

It focuses on testing whether these systems are capable of accurately converting natural language questions into valid, effective queries against various data sources. 

## Repository Structure

This repository is divided into multiple directories, each containing a specific type of data or metadata:

- `ontology/`: This directory contains OWL file(s) representing the ontology data. 

- `DDL/`: This directory contains the DDL definitions for the database schema. 

- `investigation/`: Each Turtle (.ttl) file in this directory represents a complete benchmark investigation, which includes pointers to the dataset, metadata, and a set of inquiries. 

- `data/`: This directory contains the dataset(s) used for the benchmark. The data is represented in multiple formats to support a wide range of query languages.

## File Formats

- OWL: Web Ontology Language, used for representing the ontology data.

- DDL: Data Definition Language, used for defining and managing databases.

- TTL: Turtle form of RDF, used to represent the complete benchmark investigation.

- CSV/TSV/etc.: Various data formats used for the benchmark dataset.

