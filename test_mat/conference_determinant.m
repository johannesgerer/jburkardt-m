function determ = conference_determinant ( n )

%*****************************************************************************80
%
%% CONFERENCE_DETERMINANT returns the determinant of the CONFERENCE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.  N-1 must be an odd prime,
%    or a power of an odd prime.
%
%    Output, real DETERM, the determinant.
%
  if ( mod ( n - 1, 4 ) == 1 )
    determ = - sqrt ( ( n - 1 )^n );
  else
    determ = + sqrt ( ( n - 1 )^n );
  end

  return
end
