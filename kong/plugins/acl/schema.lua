local typedefs = require "kong.db.schema.typedefs"


return {
  name = "acl",
  fields = {
    { mesh_mode = typedefs.mesh_mode_two_way },
    { consumer = typedefs.no_consumer },
    { config = {
        type = "record",
        fields = {
          { whitelist = { type = "array", elements = { type = "string" }, }, },
          { blacklist = { type = "array", elements = { type = "string" }, }, },
          { hide_groups_header = { type = "boolean", default = false }, },
        }
      }
    }
  },
  entity_checks = {
    { only_one_of = { "config.whitelist", "config.blacklist" }, },
    { at_least_one_of = { "config.whitelist", "config.blacklist" }, },
  },
}
