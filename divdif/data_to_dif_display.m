function diftab = data_to_dif_display ( ntab, xtab, ytab )

%*****************************************************************************80
%
%% DATA_TO_DIF_DISPLAY computes a divided difference table and shows how.
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
%    Input, integer NTAB, the number of pairs of points
%    (XTAB(I),YTAB(I)) which are to be used as data.  The
%    number of entries to be used in DIFTAB, XTAB and YTAB.
%
%    Input, real XTAB(NTAB), the X values at which data was taken.
%
%    Input, real YTAB(NTAB), the corresponding Y values.
%
%    Output, real DIFTAB(NTAB), the divided difference
%    coefficients corresponding to the input (XTAB,YTAB).
%
  if ( ~r8vec_distinct ( ntab, xtab ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DATA_TO_DIF_DISPLAY - Fatal error!\n' );
    fprintf ( 1, '  Two entries of XTAB are equal!\n' );
    error ( 'DATA_TO_DIF_DISPLAY - Fatal error!' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Divided difference table:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    ' );
  for i = 1 : ntab
    fprintf ( 1, '%14f', xtab(i) );
  end
  fprintf ( 1, '\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  0 ' );
  for i = 1 : ntab
    fprintf ( 1, '%14f', ytab(i) );
  end
  fprintf ( 1, '\n' );
%
%  Copy the data values into DIFTAB.
%
  diftab(1:ntab) = ytab(1:ntab);
%
%  Compute the divided differences.
%
  for i = 2 : ntab
    for j = ntab : -1 : i

      diftab(j) = ( diftab(j) - diftab(j-1) ) / ( xtab(j) - xtab(j+1-i) );

    end

    fprintf ( 1, '%3d ', i-1 );
    for j = i : ntab
      fprintf ( 1, '%14f', diftab(j) );
    end
    fprintf ( 1, '\n' );

  end

  return
end
