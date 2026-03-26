static const char norm_fg[] = "#f5edde";
static const char norm_bg[] = "#301a28";
static const char norm_border[] = "#aba59b";

static const char sel_fg[] = "#f5edde";
static const char sel_bg[] = "#AE979E";
static const char sel_border[] = "#f5edde";

static const char urg_fg[] = "#f5edde";
static const char urg_bg[] = "#9E738D";
static const char urg_border[] = "#9E738D";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
