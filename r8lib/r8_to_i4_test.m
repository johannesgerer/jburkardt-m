function r8_to_i4_test ( )

%*****************************************************************************80
%
%% R8_TO_I4_TEST tests R8_TO_I4.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 April 2009
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'R8_TO_I4_TEST\n' );
  fprintf ( 1, '  R8_TO_I4 finds an integer IX in [IXMIN,IXMAX]\n' );
  fprintf ( 1, '  corresponding to X in [XMIN,XMAX].\n' );

  xmin = 2.5;
  x = 3.5;
  xmax = 5.5;

  ixmin = 10;
  ixmax = 40;

  ix = r8_to_i4 ( xmin, xmax, x, ixmin, ixmax );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   XMIN = %12f,  X = %12f,  XMAX = %12f\n',  xmin,  x,  xmax );
  fprintf ( 1, '  IXMIN = %12d, IX = %12d, IXMAX = %12d\n', ixmin, ix, ixmax );

  return
end
