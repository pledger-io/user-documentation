---
title: Configuring your application
description: Tune database, mail, and optional AI settings with environment variables.
icon: fas sliders
thumbnail: img/getting-started/installation/configuration.svg
show_thumbnail: false
type: docs
weight: 4
---
Pledger.io uses environment variables to configure the application.

## General configuration options

| Variable | Description | Default |
| --- | --- | --- |
| `DB_TYPE` | The type of database to use, allowed are `h2` or `mysql` | h2 |

## MySQL configuration options

If the database type is set to `mysql` then the following environment variables are used.

| Variable | Description | Default |
| --- | --- | --- |
| `DATABASE_HOST` | The MySQL server host, only if `DB_TYPE` is mysql | localhost |
| `DATABASE_SCHEMA` | The MySQL schema to use, only if `DB_TYPE` is mysql | fintrack |
| `DATABASE_PASSWORD` | The MySQL user for authentication, only if `DB_TYPE` is mysql | fintrack |

## Mail configuration options

When using the mail feature of Pledger.io the following environment variables are used.

| Variable | Description | Default |
| --- | --- | --- |
| `SMTP_HOST` | The SMTP server host | - |
| `SMTP_USER` | The SMTP user for authentication | - |
| `SMTP_PASSWORD` | The SMTP password for authentication | - |

## OpenID configuration options

When you want ot enable OpenID connect in Pledger.io you will have to configure the following settings.

| Variable | Description | Default |
| --- | --- | --- |
| `OPENID_URI` | The URI to the certificate location for the Realm in OpenID | - |
| `OPENID_SECRET` | The secret for the client | - |
| `OPENID_AUTHORITY` | The URI to the realm | - |
| `OPENID_CLIENT` | The client identifier | pledger-io |

## Large Language Model options

When either using the docker image `ghcr.io/pledger-io/amd64-embedded-llm` you can configure the following options.
Alternatively you can use the normal image but use [OpenAI](https://platform.openai.com), at the cost of some privacy.

| Variable | Description | Default |
| --- | --- | --- |
| `AI_ENGINE` | The engine to use. Supported are `ollama` and `open-ai` | ollama |
| `AI_MODEL` | The Ollama model to use, only used with AI_ENGINE 'ollama' | qwen2.5-coder:1.5b |
| `AI_AUGMENTER_ENABLED` | Should the context for the LLM be expanded with budget, category and tag information | true |
| `OPENAI_TOKEN` | The application token for OpenAI, must be set when AI_ENGINE is 'open-ai' | - |

{{< alert alert-type="danger" >}}
Please leave `AI_AUGMENTER_ENABLED` enabled with the default model.
This can be disabled when using larger models as they have a better understanding of the transaction information and tools.
{{</ alert >}}
