(*
 Autogenerated by Thrift

 DO NOT EDIT UNLESS YOU ARE SURE YOU KNOW WHAT YOU ARE DOING
*)

open Thrift
module ConsistencyLevel = 
struct
  type t = 
    | ZERO
    | ONE
    | QUORUM
    | DCQUORUM
    | DCQUORUMSYNC
    | ALL
    | ANY
  let to_i = function
    | ZERO -> 0
    | ONE -> 1
    | QUORUM -> 2
    | DCQUORUM -> 3
    | DCQUORUMSYNC -> 4
    | ALL -> 5
    | ANY -> 6
  let of_i = function
    | 0 -> ZERO
    | 1 -> ONE
    | 2 -> QUORUM
    | 3 -> DCQUORUM
    | 4 -> DCQUORUMSYNC
    | 5 -> ALL
    | 6 -> ANY
    | n -> raise (Thrift_error (Printf.sprintf "Unknown ConsistencyLevel %d" n))
end
class column =
object (self)
  val mutable _name : string option = None
  method get_name = _name
  method grab_name = match _name with None->raise (Field_empty "column.name") | Some _x0 -> _x0
  method set_name _x0 = _name <- Some _x0
  val mutable _value : string option = None
  method get_value = _value
  method grab_value = match _value with None->raise (Field_empty "column.value") | Some _x0 -> _x0
  method set_value _x0 = _value <- Some _x0
  val mutable _timestamp : Int64.t option = None
  method get_timestamp = _timestamp
  method grab_timestamp = match _timestamp with None->raise (Field_empty "column.timestamp") | Some _x0 -> _x0
  method set_timestamp _x0 = _timestamp <- Some _x0
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "Column";
    (match _name with None -> () | Some _v -> 
      oprot#writeFieldBegin("name",Protocol.T_STRING,1);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _value with None -> () | Some _v -> 
      oprot#writeFieldBegin("value",Protocol.T_STRING,2);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _timestamp with None -> () | Some _v -> 
      oprot#writeFieldBegin("timestamp",Protocol.T_I64,3);
      oprot#writeI64(_v);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_column (iprot : Protocol.t) =
  let _str3 = new column in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t4,_id5) = iprot#readFieldBegin in
        if _t4 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id5 with 
          | 1 -> (if _t4 = Protocol.T_STRING then
              _str3#set_name iprot#readString
            else
              iprot#skip _t4)
          | 2 -> (if _t4 = Protocol.T_STRING then
              _str3#set_value iprot#readString
            else
              iprot#skip _t4)
          | 3 -> (if _t4 = Protocol.T_I64 then
              _str3#set_timestamp iprot#readI64
            else
              iprot#skip _t4)
          | _ -> iprot#skip _t4);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str3

class superColumn =
object (self)
  val mutable _name : string option = None
  method get_name = _name
  method grab_name = match _name with None->raise (Field_empty "superColumn.name") | Some _x7 -> _x7
  method set_name _x7 = _name <- Some _x7
  val mutable _columns : column list option = None
  method get_columns = _columns
  method grab_columns = match _columns with None->raise (Field_empty "superColumn.columns") | Some _x7 -> _x7
  method set_columns _x7 = _columns <- Some _x7
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "SuperColumn";
    (match _name with None -> () | Some _v -> 
      oprot#writeFieldBegin("name",Protocol.T_STRING,1);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _columns with None -> () | Some _v -> 
      oprot#writeFieldBegin("columns",Protocol.T_LIST,2);
      oprot#writeListBegin(Protocol.T_STRUCT,List.length _v);
      List.iter (fun _iter10 ->         _iter10#write(oprot);
      ) _v;
      oprot#writeListEnd;
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_superColumn (iprot : Protocol.t) =
  let _str11 = new superColumn in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t12,_id13) = iprot#readFieldBegin in
        if _t12 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id13 with 
          | 1 -> (if _t12 = Protocol.T_STRING then
              _str11#set_name iprot#readString
            else
              iprot#skip _t12)
          | 2 -> (if _t12 = Protocol.T_LIST then
              _str11#set_columns 
                (let (_etype17,_size14) = iprot#readListBegin in
                  let _con18 = (Array.to_list (Array.init _size14 (fun _ -> (read_column iprot)))) in
                    iprot#readListEnd; _con18)
            else
              iprot#skip _t12)
          | _ -> iprot#skip _t12);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str11

class columnOrSuperColumn =
object (self)
  val mutable _column : column option = None
  method get_column = _column
  method grab_column = match _column with None->raise (Field_empty "columnOrSuperColumn.column") | Some _x20 -> _x20
  method set_column _x20 = _column <- Some _x20
  val mutable _super_column : superColumn option = None
  method get_super_column = _super_column
  method grab_super_column = match _super_column with None->raise (Field_empty "columnOrSuperColumn.super_column") | Some _x20 -> _x20
  method set_super_column _x20 = _super_column <- Some _x20
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "ColumnOrSuperColumn";
    (match _column with None -> () | Some _v -> 
      oprot#writeFieldBegin("column",Protocol.T_STRUCT,1);
      _v#write(oprot);
      oprot#writeFieldEnd
    );
    (match _super_column with None -> () | Some _v -> 
      oprot#writeFieldBegin("super_column",Protocol.T_STRUCT,2);
      _v#write(oprot);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_columnOrSuperColumn (iprot : Protocol.t) =
  let _str23 = new columnOrSuperColumn in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t24,_id25) = iprot#readFieldBegin in
        if _t24 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id25 with 
          | 1 -> (if _t24 = Protocol.T_STRUCT then
              _str23#set_column (read_column iprot)
            else
              iprot#skip _t24)
          | 2 -> (if _t24 = Protocol.T_STRUCT then
              _str23#set_super_column (read_superColumn iprot)
            else
              iprot#skip _t24)
          | _ -> iprot#skip _t24);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str23

class columnParent =
object (self)
  val mutable _column_family : string option = None
  method get_column_family = _column_family
  method grab_column_family = match _column_family with None->raise (Field_empty "columnParent.column_family") | Some _x27 -> _x27
  method set_column_family _x27 = _column_family <- Some _x27
  val mutable _super_column : string option = None
  method get_super_column = _super_column
  method grab_super_column = match _super_column with None->raise (Field_empty "columnParent.super_column") | Some _x27 -> _x27
  method set_super_column _x27 = _super_column <- Some _x27
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "ColumnParent";
    (match _column_family with None -> () | Some _v -> 
      oprot#writeFieldBegin("column_family",Protocol.T_STRING,3);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _super_column with None -> () | Some _v -> 
      oprot#writeFieldBegin("super_column",Protocol.T_STRING,4);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_columnParent (iprot : Protocol.t) =
  let _str30 = new columnParent in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t31,_id32) = iprot#readFieldBegin in
        if _t31 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id32 with 
          | 3 -> (if _t31 = Protocol.T_STRING then
              _str30#set_column_family iprot#readString
            else
              iprot#skip _t31)
          | 4 -> (if _t31 = Protocol.T_STRING then
              _str30#set_super_column iprot#readString
            else
              iprot#skip _t31)
          | _ -> iprot#skip _t31);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str30

class columnPath =
object (self)
  val mutable _column_family : string option = None
  method get_column_family = _column_family
  method grab_column_family = match _column_family with None->raise (Field_empty "columnPath.column_family") | Some _x34 -> _x34
  method set_column_family _x34 = _column_family <- Some _x34
  val mutable _super_column : string option = None
  method get_super_column = _super_column
  method grab_super_column = match _super_column with None->raise (Field_empty "columnPath.super_column") | Some _x34 -> _x34
  method set_super_column _x34 = _super_column <- Some _x34
  val mutable _column : string option = None
  method get_column = _column
  method grab_column = match _column with None->raise (Field_empty "columnPath.column") | Some _x34 -> _x34
  method set_column _x34 = _column <- Some _x34
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "ColumnPath";
    (match _column_family with None -> () | Some _v -> 
      oprot#writeFieldBegin("column_family",Protocol.T_STRING,3);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _super_column with None -> () | Some _v -> 
      oprot#writeFieldBegin("super_column",Protocol.T_STRING,4);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _column with None -> () | Some _v -> 
      oprot#writeFieldBegin("column",Protocol.T_STRING,5);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_columnPath (iprot : Protocol.t) =
  let _str37 = new columnPath in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t38,_id39) = iprot#readFieldBegin in
        if _t38 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id39 with 
          | 3 -> (if _t38 = Protocol.T_STRING then
              _str37#set_column_family iprot#readString
            else
              iprot#skip _t38)
          | 4 -> (if _t38 = Protocol.T_STRING then
              _str37#set_super_column iprot#readString
            else
              iprot#skip _t38)
          | 5 -> (if _t38 = Protocol.T_STRING then
              _str37#set_column iprot#readString
            else
              iprot#skip _t38)
          | _ -> iprot#skip _t38);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str37

class sliceRange =
object (self)
  val mutable _start : string option = None
  method get_start = _start
  method grab_start = match _start with None->raise (Field_empty "sliceRange.start") | Some _x41 -> _x41
  method set_start _x41 = _start <- Some _x41
  val mutable _finish : string option = None
  method get_finish = _finish
  method grab_finish = match _finish with None->raise (Field_empty "sliceRange.finish") | Some _x41 -> _x41
  method set_finish _x41 = _finish <- Some _x41
  val mutable _reversed : bool option = None
  method get_reversed = _reversed
  method grab_reversed = match _reversed with None->raise (Field_empty "sliceRange.reversed") | Some _x41 -> _x41
  method set_reversed _x41 = _reversed <- Some _x41
  val mutable _count : int option = None
  method get_count = _count
  method grab_count = match _count with None->raise (Field_empty "sliceRange.count") | Some _x41 -> _x41
  method set_count _x41 = _count <- Some _x41
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "SliceRange";
    (match _start with None -> () | Some _v -> 
      oprot#writeFieldBegin("start",Protocol.T_STRING,1);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _finish with None -> () | Some _v -> 
      oprot#writeFieldBegin("finish",Protocol.T_STRING,2);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _reversed with None -> () | Some _v -> 
      oprot#writeFieldBegin("reversed",Protocol.T_BOOL,3);
      oprot#writeBool(_v);
      oprot#writeFieldEnd
    );
    (match _count with None -> () | Some _v -> 
      oprot#writeFieldBegin("count",Protocol.T_I32,4);
      oprot#writeI32(_v);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_sliceRange (iprot : Protocol.t) =
  let _str44 = new sliceRange in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t45,_id46) = iprot#readFieldBegin in
        if _t45 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id46 with 
          | 1 -> (if _t45 = Protocol.T_STRING then
              _str44#set_start iprot#readString
            else
              iprot#skip _t45)
          | 2 -> (if _t45 = Protocol.T_STRING then
              _str44#set_finish iprot#readString
            else
              iprot#skip _t45)
          | 3 -> (if _t45 = Protocol.T_BOOL then
              _str44#set_reversed iprot#readBool
            else
              iprot#skip _t45)
          | 4 -> (if _t45 = Protocol.T_I32 then
              _str44#set_count iprot#readI32
            else
              iprot#skip _t45)
          | _ -> iprot#skip _t45);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str44

class slicePredicate =
object (self)
  val mutable _column_names : string list option = None
  method get_column_names = _column_names
  method grab_column_names = match _column_names with None->raise (Field_empty "slicePredicate.column_names") | Some _x48 -> _x48
  method set_column_names _x48 = _column_names <- Some _x48
  val mutable _slice_range : sliceRange option = None
  method get_slice_range = _slice_range
  method grab_slice_range = match _slice_range with None->raise (Field_empty "slicePredicate.slice_range") | Some _x48 -> _x48
  method set_slice_range _x48 = _slice_range <- Some _x48
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "SlicePredicate";
    (match _column_names with None -> () | Some _v -> 
      oprot#writeFieldBegin("column_names",Protocol.T_LIST,1);
      oprot#writeListBegin(Protocol.T_STRING,List.length _v);
      List.iter (fun _iter51 ->         oprot#writeString(_iter51);
      ) _v;
      oprot#writeListEnd;
      oprot#writeFieldEnd
    );
    (match _slice_range with None -> () | Some _v -> 
      oprot#writeFieldBegin("slice_range",Protocol.T_STRUCT,2);
      _v#write(oprot);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_slicePredicate (iprot : Protocol.t) =
  let _str52 = new slicePredicate in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t53,_id54) = iprot#readFieldBegin in
        if _t53 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id54 with 
          | 1 -> (if _t53 = Protocol.T_LIST then
              _str52#set_column_names 
                (let (_etype58,_size55) = iprot#readListBegin in
                  let _con59 = (Array.to_list (Array.init _size55 (fun _ -> iprot#readString))) in
                    iprot#readListEnd; _con59)
            else
              iprot#skip _t53)
          | 2 -> (if _t53 = Protocol.T_STRUCT then
              _str52#set_slice_range (read_sliceRange iprot)
            else
              iprot#skip _t53)
          | _ -> iprot#skip _t53);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str52

class keyRange =
object (self)
  val mutable _start_key : string option = None
  method get_start_key = _start_key
  method grab_start_key = match _start_key with None->raise (Field_empty "keyRange.start_key") | Some _x61 -> _x61
  method set_start_key _x61 = _start_key <- Some _x61
  val mutable _end_key : string option = None
  method get_end_key = _end_key
  method grab_end_key = match _end_key with None->raise (Field_empty "keyRange.end_key") | Some _x61 -> _x61
  method set_end_key _x61 = _end_key <- Some _x61
  val mutable _start_token : string option = None
  method get_start_token = _start_token
  method grab_start_token = match _start_token with None->raise (Field_empty "keyRange.start_token") | Some _x61 -> _x61
  method set_start_token _x61 = _start_token <- Some _x61
  val mutable _end_token : string option = None
  method get_end_token = _end_token
  method grab_end_token = match _end_token with None->raise (Field_empty "keyRange.end_token") | Some _x61 -> _x61
  method set_end_token _x61 = _end_token <- Some _x61
  val mutable _count : int option = None
  method get_count = _count
  method grab_count = match _count with None->raise (Field_empty "keyRange.count") | Some _x61 -> _x61
  method set_count _x61 = _count <- Some _x61
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "KeyRange";
    (match _start_key with None -> () | Some _v -> 
      oprot#writeFieldBegin("start_key",Protocol.T_STRING,1);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _end_key with None -> () | Some _v -> 
      oprot#writeFieldBegin("end_key",Protocol.T_STRING,2);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _start_token with None -> () | Some _v -> 
      oprot#writeFieldBegin("start_token",Protocol.T_STRING,3);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _end_token with None -> () | Some _v -> 
      oprot#writeFieldBegin("end_token",Protocol.T_STRING,4);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _count with None -> () | Some _v -> 
      oprot#writeFieldBegin("count",Protocol.T_I32,5);
      oprot#writeI32(_v);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_keyRange (iprot : Protocol.t) =
  let _str64 = new keyRange in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t65,_id66) = iprot#readFieldBegin in
        if _t65 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id66 with 
          | 1 -> (if _t65 = Protocol.T_STRING then
              _str64#set_start_key iprot#readString
            else
              iprot#skip _t65)
          | 2 -> (if _t65 = Protocol.T_STRING then
              _str64#set_end_key iprot#readString
            else
              iprot#skip _t65)
          | 3 -> (if _t65 = Protocol.T_STRING then
              _str64#set_start_token iprot#readString
            else
              iprot#skip _t65)
          | 4 -> (if _t65 = Protocol.T_STRING then
              _str64#set_end_token iprot#readString
            else
              iprot#skip _t65)
          | 5 -> (if _t65 = Protocol.T_I32 then
              _str64#set_count iprot#readI32
            else
              iprot#skip _t65)
          | _ -> iprot#skip _t65);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str64

class keySlice =
object (self)
  val mutable _key : string option = None
  method get_key = _key
  method grab_key = match _key with None->raise (Field_empty "keySlice.key") | Some _x68 -> _x68
  method set_key _x68 = _key <- Some _x68
  val mutable _columns : columnOrSuperColumn list option = None
  method get_columns = _columns
  method grab_columns = match _columns with None->raise (Field_empty "keySlice.columns") | Some _x68 -> _x68
  method set_columns _x68 = _columns <- Some _x68
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "KeySlice";
    (match _key with None -> () | Some _v -> 
      oprot#writeFieldBegin("key",Protocol.T_STRING,1);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _columns with None -> () | Some _v -> 
      oprot#writeFieldBegin("columns",Protocol.T_LIST,2);
      oprot#writeListBegin(Protocol.T_STRUCT,List.length _v);
      List.iter (fun _iter71 ->         _iter71#write(oprot);
      ) _v;
      oprot#writeListEnd;
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_keySlice (iprot : Protocol.t) =
  let _str72 = new keySlice in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t73,_id74) = iprot#readFieldBegin in
        if _t73 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id74 with 
          | 1 -> (if _t73 = Protocol.T_STRING then
              _str72#set_key iprot#readString
            else
              iprot#skip _t73)
          | 2 -> (if _t73 = Protocol.T_LIST then
              _str72#set_columns 
                (let (_etype78,_size75) = iprot#readListBegin in
                  let _con79 = (Array.to_list (Array.init _size75 (fun _ -> (read_columnOrSuperColumn iprot)))) in
                    iprot#readListEnd; _con79)
            else
              iprot#skip _t73)
          | _ -> iprot#skip _t73);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str72

class deletion =
object (self)
  val mutable _timestamp : Int64.t option = None
  method get_timestamp = _timestamp
  method grab_timestamp = match _timestamp with None->raise (Field_empty "deletion.timestamp") | Some _x81 -> _x81
  method set_timestamp _x81 = _timestamp <- Some _x81
  val mutable _super_column : string option = None
  method get_super_column = _super_column
  method grab_super_column = match _super_column with None->raise (Field_empty "deletion.super_column") | Some _x81 -> _x81
  method set_super_column _x81 = _super_column <- Some _x81
  val mutable _predicate : slicePredicate option = None
  method get_predicate = _predicate
  method grab_predicate = match _predicate with None->raise (Field_empty "deletion.predicate") | Some _x81 -> _x81
  method set_predicate _x81 = _predicate <- Some _x81
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "Deletion";
    (match _timestamp with None -> () | Some _v -> 
      oprot#writeFieldBegin("timestamp",Protocol.T_I64,1);
      oprot#writeI64(_v);
      oprot#writeFieldEnd
    );
    (match _super_column with None -> () | Some _v -> 
      oprot#writeFieldBegin("super_column",Protocol.T_STRING,2);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _predicate with None -> () | Some _v -> 
      oprot#writeFieldBegin("predicate",Protocol.T_STRUCT,3);
      _v#write(oprot);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_deletion (iprot : Protocol.t) =
  let _str84 = new deletion in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t85,_id86) = iprot#readFieldBegin in
        if _t85 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id86 with 
          | 1 -> (if _t85 = Protocol.T_I64 then
              _str84#set_timestamp iprot#readI64
            else
              iprot#skip _t85)
          | 2 -> (if _t85 = Protocol.T_STRING then
              _str84#set_super_column iprot#readString
            else
              iprot#skip _t85)
          | 3 -> (if _t85 = Protocol.T_STRUCT then
              _str84#set_predicate (read_slicePredicate iprot)
            else
              iprot#skip _t85)
          | _ -> iprot#skip _t85);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str84

class mutation =
object (self)
  val mutable _column_or_supercolumn : columnOrSuperColumn option = None
  method get_column_or_supercolumn = _column_or_supercolumn
  method grab_column_or_supercolumn = match _column_or_supercolumn with None->raise (Field_empty "mutation.column_or_supercolumn") | Some _x88 -> _x88
  method set_column_or_supercolumn _x88 = _column_or_supercolumn <- Some _x88
  val mutable _deletion : deletion option = None
  method get_deletion = _deletion
  method grab_deletion = match _deletion with None->raise (Field_empty "mutation.deletion") | Some _x88 -> _x88
  method set_deletion _x88 = _deletion <- Some _x88
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "Mutation";
    (match _column_or_supercolumn with None -> () | Some _v -> 
      oprot#writeFieldBegin("column_or_supercolumn",Protocol.T_STRUCT,1);
      _v#write(oprot);
      oprot#writeFieldEnd
    );
    (match _deletion with None -> () | Some _v -> 
      oprot#writeFieldBegin("deletion",Protocol.T_STRUCT,2);
      _v#write(oprot);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_mutation (iprot : Protocol.t) =
  let _str91 = new mutation in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t92,_id93) = iprot#readFieldBegin in
        if _t92 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id93 with 
          | 1 -> (if _t92 = Protocol.T_STRUCT then
              _str91#set_column_or_supercolumn (read_columnOrSuperColumn iprot)
            else
              iprot#skip _t92)
          | 2 -> (if _t92 = Protocol.T_STRUCT then
              _str91#set_deletion (read_deletion iprot)
            else
              iprot#skip _t92)
          | _ -> iprot#skip _t92);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str91

class tokenRange =
object (self)
  val mutable _start_token : string option = None
  method get_start_token = _start_token
  method grab_start_token = match _start_token with None->raise (Field_empty "tokenRange.start_token") | Some _x95 -> _x95
  method set_start_token _x95 = _start_token <- Some _x95
  val mutable _end_token : string option = None
  method get_end_token = _end_token
  method grab_end_token = match _end_token with None->raise (Field_empty "tokenRange.end_token") | Some _x95 -> _x95
  method set_end_token _x95 = _end_token <- Some _x95
  val mutable _endpoints : string list option = None
  method get_endpoints = _endpoints
  method grab_endpoints = match _endpoints with None->raise (Field_empty "tokenRange.endpoints") | Some _x95 -> _x95
  method set_endpoints _x95 = _endpoints <- Some _x95
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "TokenRange";
    (match _start_token with None -> () | Some _v -> 
      oprot#writeFieldBegin("start_token",Protocol.T_STRING,1);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _end_token with None -> () | Some _v -> 
      oprot#writeFieldBegin("end_token",Protocol.T_STRING,2);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    (match _endpoints with None -> () | Some _v -> 
      oprot#writeFieldBegin("endpoints",Protocol.T_LIST,3);
      oprot#writeListBegin(Protocol.T_STRING,List.length _v);
      List.iter (fun _iter98 ->         oprot#writeString(_iter98);
      ) _v;
      oprot#writeListEnd;
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_tokenRange (iprot : Protocol.t) =
  let _str99 = new tokenRange in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t100,_id101) = iprot#readFieldBegin in
        if _t100 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id101 with 
          | 1 -> (if _t100 = Protocol.T_STRING then
              _str99#set_start_token iprot#readString
            else
              iprot#skip _t100)
          | 2 -> (if _t100 = Protocol.T_STRING then
              _str99#set_end_token iprot#readString
            else
              iprot#skip _t100)
          | 3 -> (if _t100 = Protocol.T_LIST then
              _str99#set_endpoints 
                (let (_etype105,_size102) = iprot#readListBegin in
                  let _con106 = (Array.to_list (Array.init _size102 (fun _ -> iprot#readString))) in
                    iprot#readListEnd; _con106)
            else
              iprot#skip _t100)
          | _ -> iprot#skip _t100);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str99

class authenticationRequest =
object (self)
  val mutable _credentials : (string,string) Hashtbl.t option = None
  method get_credentials = _credentials
  method grab_credentials = match _credentials with None->raise (Field_empty "authenticationRequest.credentials") | Some _x108 -> _x108
  method set_credentials _x108 = _credentials <- Some _x108
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "AuthenticationRequest";
    (match _credentials with None -> () | Some _v -> 
      oprot#writeFieldBegin("credentials",Protocol.T_MAP,1);
      oprot#writeMapBegin(Protocol.T_STRING,Protocol.T_STRING,Hashtbl.length _v);
      Hashtbl.iter (fun _kiter111 -> fun _viter112 -> 
        oprot#writeString(_kiter111);
        oprot#writeString(_viter112);
      ) _v;
      oprot#writeMapEnd;
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
let rec read_authenticationRequest (iprot : Protocol.t) =
  let _str113 = new authenticationRequest in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t114,_id115) = iprot#readFieldBegin in
        if _t114 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id115 with 
          | 1 -> (if _t114 = Protocol.T_MAP then
              _str113#set_credentials 
                (let (_ktype117,_vtype118,_size116) = iprot#readMapBegin in
                let _con120 = Hashtbl.create _size116 in
                  for i = 1 to _size116 do
                    let _k = iprot#readString in
                    let _v = iprot#readString in
                      Hashtbl.add _con120 _k _v
                  done; iprot#readMapEnd; _con120)
            else
              iprot#skip _t114)
          | _ -> iprot#skip _t114);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str113

class notFoundException =
object (self)
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "NotFoundException";
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
exception NotFoundException of notFoundException
let rec read_notFoundException (iprot : Protocol.t) =
  let _str125 = new notFoundException in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t126,_id127) = iprot#readFieldBegin in
        if _t126 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id127 with 
          | _ -> iprot#skip _t126);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str125

class invalidRequestException =
object (self)
  val mutable _why : string option = None
  method get_why = _why
  method grab_why = match _why with None->raise (Field_empty "invalidRequestException.why") | Some _x129 -> _x129
  method set_why _x129 = _why <- Some _x129
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "InvalidRequestException";
    (match _why with None -> () | Some _v -> 
      oprot#writeFieldBegin("why",Protocol.T_STRING,1);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
exception InvalidRequestException of invalidRequestException
let rec read_invalidRequestException (iprot : Protocol.t) =
  let _str132 = new invalidRequestException in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t133,_id134) = iprot#readFieldBegin in
        if _t133 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id134 with 
          | 1 -> (if _t133 = Protocol.T_STRING then
              _str132#set_why iprot#readString
            else
              iprot#skip _t133)
          | _ -> iprot#skip _t133);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str132

class unavailableException =
object (self)
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "UnavailableException";
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
exception UnavailableException of unavailableException
let rec read_unavailableException (iprot : Protocol.t) =
  let _str139 = new unavailableException in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t140,_id141) = iprot#readFieldBegin in
        if _t140 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id141 with 
          | _ -> iprot#skip _t140);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str139

class timedOutException =
object (self)
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "TimedOutException";
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
exception TimedOutException of timedOutException
let rec read_timedOutException (iprot : Protocol.t) =
  let _str146 = new timedOutException in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t147,_id148) = iprot#readFieldBegin in
        if _t147 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id148 with 
          | _ -> iprot#skip _t147);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str146

class authenticationException =
object (self)
  val mutable _why : string option = None
  method get_why = _why
  method grab_why = match _why with None->raise (Field_empty "authenticationException.why") | Some _x150 -> _x150
  method set_why _x150 = _why <- Some _x150
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "AuthenticationException";
    (match _why with None -> () | Some _v -> 
      oprot#writeFieldBegin("why",Protocol.T_STRING,1);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
exception AuthenticationException of authenticationException
let rec read_authenticationException (iprot : Protocol.t) =
  let _str153 = new authenticationException in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t154,_id155) = iprot#readFieldBegin in
        if _t154 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id155 with 
          | 1 -> (if _t154 = Protocol.T_STRING then
              _str153#set_why iprot#readString
            else
              iprot#skip _t154)
          | _ -> iprot#skip _t154);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str153

class authorizationException =
object (self)
  val mutable _why : string option = None
  method get_why = _why
  method grab_why = match _why with None->raise (Field_empty "authorizationException.why") | Some _x157 -> _x157
  method set_why _x157 = _why <- Some _x157
  method write (oprot : Protocol.t) =
    oprot#writeStructBegin "AuthorizationException";
    (match _why with None -> () | Some _v -> 
      oprot#writeFieldBegin("why",Protocol.T_STRING,1);
      oprot#writeString(_v);
      oprot#writeFieldEnd
    );
    oprot#writeFieldStop;
    oprot#writeStructEnd
end
exception AuthorizationException of authorizationException
let rec read_authorizationException (iprot : Protocol.t) =
  let _str160 = new authorizationException in
    ignore(iprot#readStructBegin);
    (try while true do
        let (_,_t161,_id162) = iprot#readFieldBegin in
        if _t161 = Protocol.T_STOP then
          raise Break
        else ();
        (match _id162 with 
          | 1 -> (if _t161 = Protocol.T_STRING then
              _str160#set_why iprot#readString
            else
              iprot#skip _t161)
          | _ -> iprot#skip _t161);
        iprot#readFieldEnd;
      done; ()
    with Break -> ());
    iprot#readStructEnd;
    _str160

