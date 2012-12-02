function p02_story ( )

%*****************************************************************************80
%
%% P02_STORY prints the "story" for problem 2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  This example is due to deBoor.\n' );
  fprintf ( 1, '  The data lies roughly along a straight line.  Polynomial\n' );
  fprintf ( 1, '  interpolation is inappropriate.  Instead, a least squares\n' );
  fprintf ( 1, '  approximation should be sought, of the form:\n' );
  fprintf ( 1, '    F(X) = A + B * X\n' );

  return
end
