defmodule Qdrantex.Pb.Qdrant.NullValue do
  @moduledoc false
  use Protobuf, enum: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :NULL_VALUE, 0
end

defmodule Qdrantex.Pb.Qdrant.Struct.FieldsEntry do
  @moduledoc false
  use Protobuf, map: true, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :key, 1, type: :string
  field :value, 2, type: Qdrantex.Pb.Qdrant.Value
end

defmodule Qdrantex.Pb.Qdrant.Struct do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :fields, 1, repeated: true, type: Qdrantex.Pb.Qdrant.Struct.FieldsEntry, map: true
end

defmodule Qdrantex.Pb.Qdrant.Value do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  oneof :kind, 0

  field :null_value, 1,
    type: Qdrantex.Pb.Qdrant.NullValue,
    json_name: "nullValue",
    enum: true,
    oneof: 0

  field :double_value, 2, type: :double, json_name: "doubleValue", oneof: 0
  field :integer_value, 3, type: :int64, json_name: "integerValue", oneof: 0
  field :string_value, 4, type: :string, json_name: "stringValue", oneof: 0
  field :bool_value, 5, type: :bool, json_name: "boolValue", oneof: 0
  field :struct_value, 6, type: Qdrantex.Pb.Qdrant.Struct, json_name: "structValue", oneof: 0
  field :list_value, 7, type: Qdrantex.Pb.Qdrant.ListValue, json_name: "listValue", oneof: 0
end

defmodule Qdrantex.Pb.Qdrant.ListValue do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :values, 1, repeated: true, type: Qdrantex.Pb.Qdrant.Value
end