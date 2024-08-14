module kklib

import std/num/int32

extern import
  c file "kklib-inline.c"

inline extern lib-a2any(v: a): any
  c inline "#1"

abstract value type kk-tag
  Invalid-Tag
  Open-Tag
  Box-Tag
  Box-Any-Tag
  Ref-Tag
  Function-Tag
  Bigint-Tag
  Bytes-Small-Tag
  Bytes-Tag
  Vector-Tag
  Int64-Tag
  Double-Tag
  Int32-Tag
  Float-Tag
  Int16-Tag
  CFunPtr-Tag
  IntPtr-Tag
  Evidence-Vector-Tag
  Nothing-Tag
  Just-Tag
  CPtr-Raw-Tag
  Bytes-Raw-Tag
  Unnamed-Tag(v: int32)

inline fip extern lib-tag-invalid(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_INVALID)" }
inline fip extern lib-tag-open(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_OPEN)" }
inline fip extern lib-tag-box(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_BOX)" }
inline fip extern lib-tag-box-any(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_BOX_ANY)" }
inline fip extern lib-tag-ref(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_REF)" }
inline fip extern lib-tag-function(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_FUNCTION)" }
inline fip extern lib-tag-bigint(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_BIGINT)" }
inline fip extern lib-tag-bytes-small(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_BYTES_SMALL)" }
inline fip extern lib-tag-bytes(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_BYTES)" }
inline fip extern lib-tag-vector(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_VECTOR)" }
inline fip extern lib-tag-int64(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_INT64)" }
inline fip extern lib-tag-double(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_DOUBLE)" }
inline fip extern lib-tag-int32(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_INT32)" }
inline fip extern lib-tag-float(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_FLOAT)" }
inline fip extern lib-tag-int16(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_INT16)" }
inline fip extern lib-tag-cfunptr(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_CFUNPTR)" }
inline fip extern lib-tag-intptr(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_INTPTR)" }
inline fip extern lib-tag-evv-vector(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_EVV_VECTOR)" }
inline fip extern lib-tag-nothing(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_NOTHING)" }
inline fip extern lib-tag-just(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_JUST)" }
inline fip extern lib-tag-cptr-raw(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_CPTR_RAW)" }
inline fip extern lib-tag-bytes-raw(v: int32): bool { c inline "((kk_tag_t)(#1) == KK_TAG_BYTES_RAW)" }

fip fun lib-tag(v: int32): kk-tag
  // TODO(zeph): there's a better way to do this, right?
  if lib-tag-invalid(v) return Invalid-Tag
  if lib-tag-open(v) return Open-Tag
  if lib-tag-box(v) return Box-Tag
  if lib-tag-box-any(v) return Box-Any-Tag
  if lib-tag-ref(v) return Ref-Tag
  if lib-tag-function(v) return Function-Tag
  if lib-tag-bigint(v) return Bigint-Tag
  if lib-tag-bytes-small(v) return Bytes-Small-Tag
  if lib-tag-bytes(v) return Bytes-Tag
  if lib-tag-vector(v) return Vector-Tag
  if lib-tag-int64(v) return Int64-Tag
  if lib-tag-double(v) return Double-Tag
  if lib-tag-int32(v) return Int32-Tag
  if lib-tag-float(v) return Float-Tag
  if lib-tag-int16(v) return Int16-Tag
  if lib-tag-cfunptr(v) return CFunPtr-Tag
  if lib-tag-intptr(v) return IntPtr-Tag
  if lib-tag-evv-vector(v) return Evidence-Vector-Tag
  if lib-tag-nothing(v) return Nothing-Tag
  if lib-tag-just(v) return Just-Tag
  if lib-tag-cptr-raw(v) return CPtr-Raw-Tag
  if lib-tag-bytes-raw(v) return Bytes-Raw-Tag
  Unnamed-Tag(v)

pub fun kk-tag/show(tag: kk-tag): string
  match tag
    Invalid-Tag -> "KK_TAG_INVALID"
    Open-Tag -> "KK_TAG_OPEN"
    Box-Tag -> "KK_TAG_BOX"
    Box-Any-Tag -> "KK_TAG_BOX_ANY"
    Ref-Tag -> "KK_TAG_REF"
    Function-Tag -> "KK_TAG_FUNCTION"
    Bigint-Tag -> "KK_TAG_BIGINT"
    Bytes-Small-Tag -> "KK_TAG_BYTES_SMALL"
    Bytes-Tag -> "KK_TAG_BYTES"
    Vector-Tag -> "KK_TAG_VECTOR"
    Int64-Tag -> "KK_TAG_INT64"
    Double-Tag -> "KK_TAG_DOUBLE"
    Int32-Tag -> "KK_TAG_INT32"
    Float-Tag -> "KK_TAG_FLOAT"
    Int16-Tag -> "KK_TAG_INT16"
    CFunPtr-Tag -> "KK_TAG_CFUNPTR"
    IntPtr-Tag -> "KK_TAG_INTPTR"
    Evidence-Vector-Tag -> "KK_TAG_EVV_VECTOR"
    Nothing-Tag -> "KK_TAG_NOTHING"
    Just-Tag -> "KK_TAG_JUST"
    CPtr-Raw-Tag -> "KK_TAG_CPTR_RAW"
    Bytes-Raw-Tag -> "KK_TAG_BYTES_RAW"
    Unnamed-Tag(v) -> "(kk_tag_t)" ++ v.show

inline fun select(l: list<(bool, a)>): list<a>
  l.filter-map fn((ok, a)) if ok then Just(a) else Nothing

abstract struct kk-datatype
  tag: kk-tag
  is-ptr: bool
  is-singleton: bool
  is-unique: bool
  is-null: bool

// extern lib-datatype-tag(v: any): int32
//   c "kk_datatype_tag" // kklib definition works directly 🙂
// extern lib-datatype-is-ptr(v: any): bool
//   c inline "kk_datatype_is_ptr(#1)" // but not this one, since no ctx
// extern lib-datatype-is-singleton(v: any): bool
//   c inline "kk_datatype_is_singleton(#1)"
// extern lib-datatype-is-unique(v: any): bool
//   c "kk_datatype_is_unique"
// extern lib-datatype-is-null(v: any): bool
//   c inline "kk_datatype_is_null(#1)"

// pub fun kk-datatype(x: a): kk-datatype
//   val v = lib-a2any(x)
//   Kk-datatype(
//     tag = lib-tag(lib-datatype-tag(v)),
//     is-ptr = lib-datatype-is-ptr(v),
//     is-singleton = lib-datatype-is-singleton(v),
//     is-unique = lib-datatype-is-unique(v),
//     is-null = lib-datatype-is-null(v)
//   )

abstract struct kk-box
  is-ptr: bool
  is-value: bool
  is-null: bool
  is-any: bool
  content: kk-box-content

abstract type kk-box-content
  Value
  Block
    tag: kk-tag
    is-valid: bool
    is-unique: bool
    is-thread-shared: bool

inline extern lib-box-is-ptr(x: any): bool
  c inline "kk_box_is_ptr(#1)"
inline extern lib-box-is-value(x: any): bool
  c inline "kk_box_is_value(#1)"
inline extern lib-box-is-null(x: any): bool
  c inline "kk_box_is_null(#1)"
inline extern lib-box-is-any(x: any): bool
  c inline "kk_box_is_any(#1)"

// Reflect an arbitrary Koka value.
pub fun kk-box(x: a): kk-box
  val v = lib-a2any(x)
  val content = if lib-box-is-value(v) then Value
  else
    val flags = lib-block-flags(v)
    Block(
      tag = lib-tag(lib-block-tag(v)),
      is-valid = flags.and(1.int32).bool,
      is-unique = flags.and(2.int32).bool,
      is-thread-shared = flags.and(4.int32).bool
    )
  Kk-box(
    content = content,
    is-ptr = lib-box-is-ptr(v),
    is-value = lib-box-is-value(v),
    is-null = lib-box-is-null(v),
    is-any = lib-box-is-any(v)
  )

pub fun kk-box/show(b: kk-box): string
  val fields = [
    (b.is-ptr, "ptr"),
    (b.is-value, "value"),
    (b.is-null, "null"),
    (b.is-any, "any"),
  ].select.join(", ")
  fields ++ " box(" ++ b.content.show ++ ")"

extern lib-block-tag(x: any): int32
  c "kk_lib_block_tag"
extern lib-block-flags(x: any): int32
  c "kk_lib_block_flags"

pub fun kk-box-content/show(b: kk-box-content): string
  match b
    Value -> "value"
    Block(tag, is-valid, is-unique, is-thread-shared) ->
      val fields = [
        (!is-valid, "invalid"),
        (is-valid, "valid"),
        (is-unique, "unique"),
        (is-thread-shared, "thread-shared")
      ].select.join(", ")
      fields ++ " block(" ++ tag.show ++ ")"
