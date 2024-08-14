
#include <kklib.h>

#include "kklib_kklib.h"

static kk_tag_t kk_lib_block_tag(kk_box_t box, kk_context_t *ctx) {
	if (kk_box_is_value(box)) {
		return KK_TAG_INVALID;
	}
	kk_block_t *b = kk_box_to_ptr(box, ctx);
	return kk_block_tag(b);
}

static int32_t kk_lib_block_flags(kk_box_t box, kk_context_t *ctx) {
	if (kk_box_is_value(box)) {
		return 0;
	}
	kk_block_t *b = kk_box_to_ptr(box, ctx);
	int32_t r = 0;
	if (kk_block_is_valid(b)) {
		r |= 1;
	}
	if (kk_block_is_unique(b)) {
		r |= 2;
	}
	if (kk_block_is_thread_shared(b)) {
		r |= 4;
	}
	return r;
}
