local typedefs = require "kong.db.schema.typedefs"


return {
  name = "basic-auth",
  fields = {
    { mesh_mode = typedefs.mesh_mode_two_way },
    { consumer = typedefs.no_consumer },
    { config = {
        type = "record",
        fields = {
          { anonymous = { type = "string", uuid = true, legacy = true }, },
          { hide_credentials = { type = "boolean", default = false }, },
    }, }, },
  },
}
