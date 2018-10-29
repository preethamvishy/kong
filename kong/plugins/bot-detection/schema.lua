local typedefs = require "kong.db.schema.typedefs"

return {
  name = "bot-detection",
  fields = {
    { consumer = typedefs.no_consumer },
    { config = {
        type = "record",
        fields = {
          { mesh_mode = typedefs.mesh_mode_two_way },
          { whitelist = {
              type = "array",
              elements = { type = "string", is_regex = true },
              default = {},
          }, },
          { blacklist = {
              type = "array",
              elements = { type = "string", is_regex = true },
              default = {},
          }, },
    }, }, },
  },
}
