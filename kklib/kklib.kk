module kklib

abstract value type kk-tag
  Invalid-Tag(v: int16)
  Open-Tag(v: int16)
  Box-Tag(v: int16)
  Box-Any-Tag(v: int16)
  Ref-Tag(v: int16)
  Function-Tag(v: int16)
  Bigint-Tag(v: int16)
  Bytes-Small-Tag(v: int16)
  Bytes-Tag(v: int16)
  Vector-Tag(v: int16)
  Int64-Tag(v: int16)
  Double-Tag(v: int16)
  Int32-Tag(v: int16)
  Float-Tag(v: int16)
  Int16-Tag(v: int16)
  CFunPtr-Tag(v: int16)
  IntPtr-Tag(v: int16)
  Evidence-Vector-Tag(v: int16)
  Nothing-Tag(v: int16)
  Just-Tag(v: int16)
  CPtr-Raw-Tag(v: int16)
  Bytes-Raw-Tag(v: int16)
  Unnamed-Tag(v: int16)

inline fip extern lib-tag-invalid(v: int16): bool { c inline "(#1 == KK_TAG_INVALID)" }
inline fip extern lib-tag-open(v: int16): bool { c inline "(#1 == KK_TAG_OPEN)" }
inline fip extern lib-tag-box(v: int16): bool { c inline "(#1 == KK_TAG_BOX)" }
inline fip extern lib-tag-box-any(v: int16): bool { c inline "(#1 == KK_TAG_BOX_ANY)" }
inline fip extern lib-tag-ref(v: int16): bool { c inline "(#1 == KK_TAG_REF)" }
inline fip extern lib-tag-function(v: int16): bool { c inline "(#1 == KK_TAG_FUNCTION)" }
inline fip extern lib-tag-bigint(v: int16): bool { c inline "(#1 == KK_TAG_BIGINT)" }
inline fip extern lib-tag-bytes-small(v: int16): bool { c inline "(#1 == KK_TAG_BYTES_SMALL)" }
inline fip extern lib-tag-bytes(v: int16): bool { c inline "(#1 == KK_TAG_BYTES)" }
inline fip extern lib-tag-vector(v: int16): bool { c inline "(#1 == KK_TAG_VECTOR)" }
inline fip extern lib-tag-int64(v: int16): bool { c inline "(#1 == KK_TAG_INT64)" }
inline fip extern lib-tag-double(v: int16): bool { c inline "(#1 == KK_TAG_DOUBLE)" }
inline fip extern lib-tag-int32(v: int16): bool { c inline "(#1 == KK_TAG_INT32)" }
inline fip extern lib-tag-float(v: int16): bool { c inline "(#1 == KK_TAG_FLOAT)" }
inline fip extern lib-tag-int16(v: int16): bool { c inline "(#1 == KK_TAG_INT16)" }
inline fip extern lib-tag-cfunptr(v: int16): bool { c inline "(#1 == KK_TAG_CFUNPTR)" }
inline fip extern lib-tag-intptr(v: int16): bool { c inline "(#1 == KK_TAG_INTPTR)" }
inline fip extern lib-tag-evv-vector(v: int16): bool { c inline "(#1 == KK_TAG_EVV_VECTOR)" }
inline fip extern lib-tag-nothing(v: int16): bool { c inline "(#1 == KK_TAG_NOTHING)" }
inline fip extern lib-tag-just(v: int16): bool { c inline "(#1 == KK_TAG_JUST)" }
inline fip extern lib-tag-cptr-raw(v: int16): bool { c inline "(#1 == KK_TAG_CPTR_RAW)" }
inline fip extern lib-tag-bytes-raw(v: int16): bool { c inline "(#1 == KK_TAG_BYTES_RAW)" }

fip fun lib-tag(v: int16): kk-tag
  // TODO(zeph): there's a better way to do this, right?
  if lib-tag-invalid(v) return Invalid-Tag(v)
  if lib-tag-open(v) return Open-Tag(v)
  if lib-tag-box(v) return Box-Tag(v)
  if lib-tag-box-any(v) return Box-Any-Tag(v)
  if lib-tag-ref(v) return Ref-Tag(v)
  if lib-tag-function(v) return Function-Tag(v)
  if lib-tag-bigint(v) return Bigint-Tag(v)
  if lib-tag-bytes-small(v) return Bytes-Small-Tag(v)
  if lib-tag-bytes(v) return Bytes-Tag(v)
  if lib-tag-vector(v) return Vector-Tag(v)
  if lib-tag-int64(v) return Int64-Tag(v)
  if lib-tag-double(v) return Double-Tag(v)
  if lib-tag-int32(v) return Int32-Tag(v)
  if lib-tag-float(v) return Float-Tag(v)
  if lib-tag-int16(v) return Int16-Tag(v)
  if lib-tag-cfunptr(v) return CFunPtr-Tag(v)
  if lib-tag-intptr(v) return IntPtr-Tag(v)
  if lib-tag-evv-vector(v) return Evidence-Vector-Tag(v)
  if lib-tag-nothing(v) return Nothing-Tag(v)
  if lib-tag-just(v) return Just-Tag(v)
  if lib-tag-cptr-raw(v) return CPtr-Raw-Tag(v)
  if lib-tag-bytes-raw(v) return Bytes-Raw-Tag(v)
  Unnamed-Tag(v)

abstract struct kk-datatype
  tag: kk-tag
  is-ptr: bool
  is-singleton: bool
  is-unique: bool
  is-null: bool

// extern lib-datatype-tag(v: any): int16
//   c "kk_datatype_tag" // kklib definition works directly 🙂
// extern lib-datatype-is-ptr(v: any): bool
//   c inline "kk_datatype_is_ptr(#1)" // but not this one, since no ctx
// extern lib-datatype-is-singleton(v: any): bool
//   c inline "kk_datatype_is_singleton(#1)"
// extern lib-datatype-is-unique(v: any): bool
//   c "kk_datatype_is_unique"
// extern lib-datatype-is-null(v: any): bool
//   c inline "kk_datatype_is_null(#1)"

inline extern lib-a2any(v: a): any
  c inline "#1"

// pub fun kk-datatype(x: a): kk-datatype
//   val v = lib-a2any(x)
//   Kk-datatype(
//     tag = lib-tag(lib-datatype-tag(v)),
//     is-ptr = lib-datatype-is-ptr(v),
//     is-singleton = lib-datatype-is-singleton(v),
//     is-unique = lib-datatype-is-unique(v),
//     is-null = lib-datatype-is-null(v)
//   )

abstract ref struct kk-box
  is-ptr: bool
  is-value: bool
  is-null: bool
  is-any: bool

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
  Kk-box(
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
  ].filter-map fn(u) if u.fst then Just(u.snd) else Nothing
  "box: " ++ fields.join(", ")
