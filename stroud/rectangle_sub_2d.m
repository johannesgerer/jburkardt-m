function result = rectangle_sub_2d ( func, xval, yval, nsub, norder, xtab, ...
  ytab, weight )

%*****************************************************************************80
%
%% RECTANGLE_SUB_2D carries out a composite quadrature over a rectangle in 2D.
%
%  Integration region:
%
%    XVAL(1) <= X <= XVAL(2),
%    YVAL(1) <= Y <= YVAL(2).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    22 May 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, external FUNC, the name of the function to be
%    integrated.  The user must declare the name an EXTERNAL
%    parameter in the calling program, pass the name of the
%    function in FUNC, and write a function of the form
%      function value = func ( x, y )
%    which evaluates the function at the point (X,Y).
%
%    Input, real XVAL(2), the left and right X coordinates.
%
%    Input, real YVAL(2), the lower and upper Y coordinates.
%
%    Input, integer NSUB(2).
%    NSUB(1) is the number of subintervals to use in the X direction,
%    and NSUB(2) is the same thing for Y.
%
%    Input, integer NORDER, the order of the rule.
%
%    Input, real XTAB(NORDER), YTAB(NORDER), the abscissas.
%
%    Input, real WEIGHT(NORDER), the weights of the rule.
%
%    Output, real RESULT, the approximate integral of the function.
%
  a(1) = xval(1);
  a(2) = yval(1);
  b(1) = xval(2);
  b(2) = yval(2);

  for i = 1 : 2
    if ( a(i) == b(i) )
      result = 0.0E+00;
      return
    end
  end

  for i = 1 : 2
    if ( nsub(i) < 1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RECTANGLE_SUB_2D - Fatal error!\n' );
      fprintf ( 1, '  Nonpositive value of NSUB(I) = %d\n', nsub(i) );
      fprintf ( 1, '  for index I = %d\n', i );
      error ( 'RECTANGLE_SUB_2D - Fatal error!' );
    end
  end
%
%  Break up the X interval into NSUB(1) subintervals.
%
  volume = 0.0E+00;
  result = 0.0E+00;

  for i = 1 : nsub(1)

    xlo = r8vec_even_select ( a(1), b(1), nsub(1)+1, i );
    xhi = r8vec_even_select ( a(1), b(1), nsub(1)+1, i+1 );
%
%  Break up the Y interval into NSUB(2) subintervals.
%
    for j = 1 : nsub(2)

      ylo = r8vec_even_select ( a(2), b(2), nsub(2)+1, j );
      yhi = r8vec_even_select ( a(2), b(2), nsub(2)+1, j+1 );

      quad_sub = 0.0E+00;
      for k = 1 : norder

        x = xlo + 0.5E+00 * ( xtab(k) + 1.0E+00 ) * ( xhi - xlo );
        y = ylo + 0.5E+00 * ( ytab(k) + 1.0E+00 ) * ( yhi - ylo );

        quad_sub = quad_sub + weight(k) * feval ( func, x, y ) / 4.0E+00;

      end

      volume_sub = ( xhi - xlo ) * ( yhi - ylo );
      result_sub = quad_sub * volume_sub;

      volume = volume + volume_sub;
      result = result + result_sub;

    end

  end

  return
end
