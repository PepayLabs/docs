---
title: OpenAPI
sidebar_position: 5
---

# OpenAPI

You can sync GitBook pages with an OpenAPI or Swagger file or a URL to include auto-generated API methods in your documentation.

## OpenAPI Block

GitBook's OpenAPI block is powered by [Scalar](https://scalar.com/), so you can test your APIs directly from your docs.

### Example: Pet Store API

Here's an example of an OpenAPI specification integrated into documentation:

**Endpoint:** `POST /pet`  
**Source:** [Pet Store OpenAPI Specification](https://petstore3.swagger.io/api/v3/openapi.json)

## Features

- **Auto-generated Documentation**: Automatically generate API documentation from OpenAPI/Swagger specifications
- **Interactive Testing**: Test APIs directly from the documentation using Scalar's interface
- **Real-time Sync**: Keep documentation synchronized with your API specifications
- **Multiple Format Support**: Works with both OpenAPI 3.0 and Swagger 2.0 specifications

## How to Use

1. **From URL**: Provide a URL to your OpenAPI specification
2. **From File**: Upload your OpenAPI or Swagger file directly
3. **Auto-sync**: Enable automatic synchronization to keep documentation up-to-date

## Benefits

- **Consistency**: Ensure documentation always matches your API implementation
- **Efficiency**: Reduce manual documentation effort
- **Interactivity**: Allow users to explore and test APIs without leaving the docs
- **Standardization**: Follow industry-standard API documentation practices

## Best Practices

- Keep your OpenAPI specifications up-to-date
- Include detailed descriptions for all endpoints
- Provide example requests and responses
- Document all possible error responses
- Use schema definitions for complex data types