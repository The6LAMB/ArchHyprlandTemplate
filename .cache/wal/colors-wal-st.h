const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#301a28", /* black   */
  [1] = "#9E738D", /* red     */
  [2] = "#AE979E", /* green   */
  [3] = "#DBB299", /* yellow  */
  [4] = "#FBCF8F", /* blue    */
  [5] = "#F6DBB3", /* magenta */
  [6] = "#D2B5C5", /* cyan    */
  [7] = "#f5edde", /* white   */

  /* 8 bright colors */
  [8]  = "#aba59b",  /* black   */
  [9]  = "#9E738D",  /* red     */
  [10] = "#AE979E", /* green   */
  [11] = "#DBB299", /* yellow  */
  [12] = "#FBCF8F", /* blue    */
  [13] = "#F6DBB3", /* magenta */
  [14] = "#D2B5C5", /* cyan    */
  [15] = "#f5edde", /* white   */

  /* special colors */
  [256] = "#301a28", /* background */
  [257] = "#f5edde", /* foreground */
  [258] = "#f5edde",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
