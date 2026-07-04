---
title: Using the AI features
icon: fas robot
type: docs
weight: 1
---
>[!CAUTION]
>This functionality is still under active development and should be considered a `preview` feature.
>Some of the configuration or usage may be a bit more difficult.

Since version `4.0.0` of Pledger.io support for Large Language Models (LLM) has been added.
A Large Language Model (LLM) is an advanced machine learning model trained on vast amounts of text data to understand, generate, and process human-like natural language.

Pledger.io supports the following types of LLM engines:

1. [Open AI](https://platform.openai.com), a cloud based LLM
2. [Ollama](https://ollama.com), a local hosted LLM

## How will the AI help you

Pledger.io currently only has very limited features build using the LLM.
The following is added at this time:

* Making suggestions for budget, category and tags based upon the description, bank accounts and amount in the transaction form.

## Privacy focussed option

For those users that want their financial data to remain private you can use the Ollama version.
A special version of the Docker Image is released that contains the Ollama software alongside Pledger.io.

NOTE: Use this docker image `ghcr.io/pledger-io/amd64-embedded-llm`.

When starting the docker image it will automatically download the model configured in the environment.
Please see the page `[Large Language Model options](/getting-started/installation/configuration/)` for how to configure Pledger.io correctly.

### Choosing different AI models

For most users it is advised to not change the model used by Ollama, the picked model has the best accuracy vs performance.
If you have an Nvidia or AMD GPU you may be able to utilize that to power Ollama.
This would allow you to pick a larger model like `llama3.3` or `mistral`.

You can view the full list of available models on the [Ollama website](https://ollama.com/search).

### Enhance performance by using your GPU

Ollama supports using the [GPU](https://github.com/ollama/ollama/blob/main/docs/gpu.md) to speed up the responses of the LLM.
To utilize the GPU you would have to adopt the docker command to something like this:

```shell
 docker run -d \
         -v pledger_logs:/opt/storage/logs \
         -v pledger_uploads:/opt/storage/upload \
         -p 8080:8080 \
         --gpus=all \
         --name pledger \
         -e DB_TYPE=mysql
         -e DATABASE_HOST=mariadb
         -e DATABASE_SCHEMA=pledger
         -e DATABASE_USER=pledger
         -e DATABASE_PASSWORD=pledger
         -e AI_MODEL=llama3.3
         ghcr.io/pledger-io/amd64-embedded-llm:stable
```

## OpenAI based AI

As an alternative to hosting the AI agent yourself you could choose to user Open AI.
The results from Open AI will be more accurate than the Ollama based once as the model used is far more advanced.

WARNING: Be aware that information will be sent from Pledger.io to Open AI.
Pledger.io will allow access to the list of budgets, categories and tags, as well as the information of any transaction that you are editing.

### Generating an API key

1. Visit the [OpenAI website](https://platform.openai.com).
2. Click on "Sign Up" if you don't have an account, or "Log In" if you already have one.
3. Complete the required verification steps.
4. Visit the [API key page](https://platform.openai.com/api-keys).
5. Hit the "Create new key" option.
6. Set a name, a project and choose "All" permissions.
7. Hit "Create" and copy the key somewhere safe for usage in Pledger.io.

### Configuring Pledger.io to use Open AI

For Open AI to be used you will have to set the following environment variables:

- `AI_ENGINE` should be set to `open-ai`.
- `OPENAI_TOKEN` should contain the key that [was created before](#open_ai_generate_token).

>[!NOTE]
>If you are not using the docker image with embedded LLM you *must* also set the `MICRAUT_PROFILES` variable to `ai`.
>This will enable the AI features inside Pledger.io.
