class SwaggerController < ApplicationController
  def generate_swagger_yaml
    swagger_doc = {
      openapi: '3.0.1',
      info: {
        title: 'Animal API Documentation',
        version: 'v1',
        description: 'API documentation for my application.'
      },
      paths: {
        '/animals': {
          get: {
            summary: 'Get a list of animals',
            description: 'Returns a list of animals.',
            responses: {
              '200': {
                description: 'List of animals successfully retrieved',
                content: {
                  'application/json': {
                    schema: {
                      type: 'array',
                      items: {
                        type: 'object',
                        properties: {
                          id: { type: 'integer' },
                          name: { type: 'string' },
                          order: { type: 'string' },
                          family: { type: 'string' }
                        }
                      }
                    }
                  }
                }
              }
            }
          },
          post: {
            summary: 'Create a new animal',
            description: 'Creates a new animal.',
            requestBody: {
              required: true,
              content: {
                'application/json': {
                  schema: {
                    type: 'object',
                    properties: {
                      name: { type: 'string' },
                      order: { type: 'string' },
                      family: { type: 'string' }
                    }
                  }
                }
              }
            },
            responses: {
              '201': {
                description: 'Animal successfully created',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        id: { type: 'integer' },
                        name: { type: 'string' },
                        order: { type: 'string' },
                        family: { type: 'string' }
                      }
                    }
                  }
                }
              },
              '400': {
                description: 'Bad Request',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        error: { type: 'string' }
                      }
                    }
                  }
                }
              }
            }
          }
        },
        '/animals/{id}': {
          put: {
            summary: 'Update an existing animal',
            description: 'Updates an existing animal.',
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                schema: {
                  type: 'integer'
                }
              }
            ],
            requestBody: {
              required: true,
              content: {
                'application/json': {
                  schema: {
                    type: 'object',
                    properties: {
                      name: { type: 'string' },
                      order: { type: 'string' },
                      family: { type: 'string' }
                    }
                  }
                }
              }
            },
            responses: {
              '200': {
                description: 'Animal successfully updated',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        id: { type: 'integer' },
                        name: { type: 'string' },
                        order: { type: 'string' },
                        family: { type: 'string' }
                      }
                    }
                  }
                }
              },
              '400': {
                description: 'Bad Request',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        error: { type: 'string' }
                      }
                    }
                  }
                }
              }
            }
          },
          patch: {
            summary: 'Partially update an existing animal',
            description: 'Partially updates an existing animal.',
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                schema: {
                  type: 'integer'
                }
              }
            ],
            requestBody: {
              required: true,
              content: {
                'application/json': {
                  schema: {
                    type: 'object',
                    properties: {
                      name: { type: 'string' },
                      order: { type: 'string' },
                      family: { type: 'string' }
                    }
                  }
                }
              }
            },
            responses: {
              '200': {
                description: 'Animal successfully partially updated',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        id: { type: 'integer' },
                        name: { type: 'string' },
                        order: { type: 'string' },
                        family: { type: 'string' }
                      }
                    }
                  }
                }
              },
              '400': {
                description: 'Bad Request',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        error: { type: 'string' }
                      }
                    }
                  }
                }
              }
            }
          },
          delete: {
            summary: 'Delete an existing animal',
            description: 'Deletes an existing animal.',
            parameters: [
              {
                name: 'id',
                in: 'path',
                required: true,
                schema: {
                  type: 'integer'
                }
              }
            ],
            responses: {
              '204': {
                description: 'Animal successfully deleted'
              },
              '400': {
                description: 'Bad Request',
                content: {
                  'application/json': {
                    schema: {
                      type: 'object',
                      properties: {
                        error: { type: 'string' }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    render json: swagger_doc
  end
end
