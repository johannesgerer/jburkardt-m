function [ y, j, f, ierror ] = yjf_check_english ( y, j, f )

%*****************************************************************************80
%
%% YJF_CHECK_ENGLISH normalizes an English YJF date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, J, real F, the YJF date.
%
%    Output, integer IERROR, nonzero if there was an error.
%
  [ y, j, ierror ] = yj_check_english ( y, j );

  if ( ierror ~= 0 )
    return
  end
%
%  Force the fraction to lie between 0 and 1.
%
  while ( f < 0.0 )
    f = f + 1.0
    j = j - 1;
  end

  while ( 1.0 <= f )
    f = f - 1.0;
    j = j + 1;
  end

  return
end
