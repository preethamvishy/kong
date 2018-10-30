local typedefs = require "kong.db.schema.typedefs"


return {
  name = "key-auth",
  fields = {
    { mesh_mode = typedefs.mesh_mode_two_way },
    { consumer = typedefs.no_consumer },
    { config = {
        type = "record",
        fields = {
          { key_names = {
              type = "array",
              required = true,
              elements = typedefs.header_name,
              default = { "apikey" },
          }, },
          { hide_credentials = { type = "boolean", default = false }, },
          { anonymous = { type = "string", uuid = true, legacy = true }, },
          { key_in_body = { type = "boolean", default = false }, },
          { run_on_preflight = { type = "boolean", default = true }, },
        },
    }, },
  },
}
