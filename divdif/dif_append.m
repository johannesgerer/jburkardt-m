function [ ntab, xtab, diftab ] = dif_append ( ntab, xtab, diftab, xval, yval )

%*****************************************************************************80
%
%% DIF_APPEND adds a pair of data values to a divided difference table.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer NTAB, the size of the table.
%
%    Input, real XTAB(NTAB), the abscissas of the table.
%
%    Input, real DIFTAB(NTAB), the difference table.
%
%    Input, real XVAL, the X data value to be inserted as XTAB(1).
%
%    Input, real YVAL, the Y data value to be inserted as YTAB(1).
%
%    Output, integer NTAB, the updated size of the table, which 
%    has increased by 1.
%
%    Output, real XTAB(NTAB), the updated abscissas.
%
%    Output, real DIFTAB(NTAB), the updated difference table.
%
  ntab = ntab + 1;
  diftab(ntab) = 0.0;
  xtab(ntab) = 0.0;
%
%  Move the original data up one index.
%
  diftab(2:ntab) = diftab(1:ntab-1);
  xtab(2:ntab) = xtab(1:ntab-1);
%
%  Insert the new data.
%
  diftab(1) = yval;
  xtab(1) = xval;
%
%  Recompute the difference table.
%
  for i = 2 : ntab
    diftab(i) = ( diftab(i) - diftab(i-1) ) / ( xtab(i) - xtab(1) );
  end

  return
end
