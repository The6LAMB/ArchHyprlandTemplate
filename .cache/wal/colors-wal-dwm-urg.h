static const char norm_fg[] = "#c2c0c3";
static const char norm_bg[] = "#0d0610";
static const char norm_border[] = "#635669";

static const char sel_fg[] = "#c2c0c3";
static const char sel_bg[] = "#9A906D";
static const char sel_border[] = "#c2c0c3";

static const char urg_fg[] = "#c2c0c3";
static const char urg_bg[] = "#E8E63F";
static const char urg_border[] = "#E8E63F";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
