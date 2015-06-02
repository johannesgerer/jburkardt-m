function hail_test ( )

%*****************************************************************************80
%
%% HAIL_TEST tests HAIL.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 October 2008
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'HAIL_TEST\n' );
  fprintf ( 1, '  HAIL(I) computes the length of the hail sequence\n' );
  fprintf ( 1, '  for I, also known as the 3*N+1 sequence.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  I,  HAIL(I)\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 20
    fprintf ( 1, '%2d  %6d\n', i, hail(i) );
  end
 
  return
end
