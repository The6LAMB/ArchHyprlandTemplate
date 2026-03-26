/* Taken from https://github.com/djpohly/dwl/issues/466 */
#define COLOR(hex)    { ((hex >> 24) & 0xFF) / 255.0f, \
                        ((hex >> 16) & 0xFF) / 255.0f, \
                        ((hex >> 8) & 0xFF) / 255.0f, \
                        (hex & 0xFF) / 255.0f }

static const float rootcolor[]             = COLOR(0x0d0610ff);
static uint32_t colors[][3]                = {
	/*               fg          bg          border    */
	[SchemeNorm] = { 0xc2c0c3ff, 0x0d0610ff, 0x635669ff },
	[SchemeSel]  = { 0xc2c0c3ff, 0x9A906Dff, 0xE8E63Fff },
	[SchemeUrg]  = { 0xc2c0c3ff, 0xE8E63Fff, 0x9A906Dff },
};
