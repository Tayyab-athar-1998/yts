class YTSSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  def self.id_from_object(object, type_definition, _query_ctx)
    GraphQL::Schema::UniqueWithinType.encode(type_definition.graphql_name, object.id)
  end

  def self.object_from_id(id, _query_ctx)
    class_name, item_id = MyApp::GlobalId.decrypt(id)
    # "Post" => Post.find(item_id)
    Object.const_get(class_name).find(item_id)
  end

  def self.resolve_type(_type, obj, _ctx)
    "Types::#{obj.class.name}Type".constantize
  rescue NameError
    raise("Unexpected object: #{obj}")
  end
end
