function a = r8vec_01_to_ab ( n, a, amax, amin )

%*****************************************************************************80
%
%% R8VEC_01_TO_AB shifts and rescales data to lie within given bounds.
%
%  Discussion:
%
%    On input, A contains the original data, which is presumed to lie
%    between 0 and 1.  However, it is not necessary that this be so.
%
%    On output, A has been shifted and rescaled so that all entries which
%    on input lay in [0,1] now lie between AMIN and AMAX.  Other entries will
%    be mapped in a corresponding way.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 May 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of data values.
%
%    Input, real A(N), the vector to be rescaled.
%
%    Input, real AMAX, AMIN, the maximum and minimum values
%    allowed for A.
%
%    Output, real A(N), the rescaled vector.
%
  if ( amax == amin )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8VEC_01_TO_AB - Fatal error!\n' );
    fprintf ( 1, '  AMAX = AMIN\n' );
    fprintf ( 1, '  AMAX = %f\n', amax );
    fprintf ( 1, '  AMIN = %f\n', amin );
    fprintf ( 1, 'R8VEC_01_TO_AB - Fatal error!\n' );
  end

  amax2 = max ( amax, amin );
  amin2 = min ( amax, amin );

  amin3 = min ( a(1:n) );
  amax3 = max ( a(1:n) );

  if ( amax3 ~= amin3 )

    a(1:n) = ( ( amax3 - a(1:n)         ) * amin2   ...
             + (         a(1:n) - amin3 ) * amax2 ) ...
             / ( amax3          - amin3 );

  else

    a(1:n) = 0.5 * ( amax2 + amin2 );

  end

  return
end
