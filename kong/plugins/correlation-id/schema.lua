local typedefs = require "kong.db.schema.typedefs"


return {
  name = "correlation-id",
  fields = {
    { config = {
        type = "record",
        fields = {
          { mesh_mode = typedefs.mesh_mode_two_way },
          { header_name = { type = "string", default = "Kong-Request-ID" }, },
          { generator = { type = "string", default = "uuid#counter",
                          one_of = { "uuid", "uuid#counter", "tracker" }, }, },
          { echo_downstream = { type = "boolean", default = false, }, },
        },
      },
    },
  },
}
