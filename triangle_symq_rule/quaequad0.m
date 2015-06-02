function [ xnew, ynew, w ] = quaequad0 ( mmax, kk )

%*****************************************************************************80
%
%% QUAEQUAD0 returns the requested quadrature rule.
%
%  Licensing:
%
%    This code is distributed under the GNU GPL license.
%
%  Modified:
%
%    28 June 2014
%
%  Author:
%
%    Original FORTRAN77 version by Hong Xiao, Zydrunas Gimbutas.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Hong Xiao, Zydrunas Gimbutas,
%    A numerical algorithm for the construction of efficient quadrature
%    rules in two and higher dimensions,
%    Computers and Mathematics with Applications,
%    Volume 59, 2010, pages 663-676.
%
%  Parameters:
%
%    Input, integer MMAX, the degree of the quadrature (the 
%    maximum degree of the polynomials of two variables that are integrated
%    exactly.  1 <= MMAX <= 50.
%
%    Input, integer KK, the number of points in the compressed rule.
%
%    Output, real XNEW(KK), YNEW(KK), the
%    coordinates of the nodes.
%
%    Output, real W(Kk), the weights.
%

%
%  Copy the arrays defining the compressed rule.
%
  if ( mmax == 1 )
    [ xnew, ynew, w ] = rule01 ( );
  elseif ( mmax == 2 )
    [ xnew, ynew, w ] = rule02 ( );
  elseif ( mmax == 3 )
    [ xnew, ynew, w ] = rule03 ( );
  elseif ( mmax == 4 )
    [ xnew, ynew, w ] = rule04 ( );
  elseif ( mmax == 5 )
    [ xnew, ynew, w ] = rule05 ( );
  elseif ( mmax == 6 )
    [ xnew, ynew, w ] = rule06 ( );
  elseif ( mmax == 7 )
    [ xnew, ynew, w ] = rule07 ( );
  elseif ( mmax == 8 )
    [ xnew, ynew, w ] = rule08 ( );
  elseif ( mmax == 9 )
    [ xnew, ynew, w ] = rule09 ( );
  elseif ( mmax == 10 )
    [ xnew, ynew, w ] = rule10 ( );
  elseif ( mmax == 11 )
    [ xnew, ynew, w ] = rule11 ( );
  elseif ( mmax == 12 )
    [ xnew, ynew, w ] = rule12 ( );
  elseif ( mmax == 13 )
    [ xnew, ynew, w ] = rule13 ( );
  elseif ( mmax == 14 )
    [ xnew, ynew, w ] = rule14 ( );
  elseif ( mmax == 15 )
    [ xnew, ynew, w ] = rule15 ( );
  elseif ( mmax == 16 )
    [ xnew, ynew, w ] = rule16 ( );
  elseif ( mmax == 17 )
    [ xnew, ynew, w ] = rule17 ( );
  elseif ( mmax == 18 )
    [ xnew, ynew, w ] = rule18 ( );
  elseif ( mmax == 19 )
    [ xnew, ynew, w ] = rule19 ( );
  elseif ( mmax == 20 )
    [ xnew, ynew, w ] = rule20 ( );
  elseif ( mmax == 21 )
    [ xnew, ynew, w ] = rule21 ( );
  elseif ( mmax == 22 )
    [ xnew, ynew, w ] = rule22 ( );
  elseif ( mmax == 23 )
    [ xnew, ynew, w ] = rule23 ( );
  elseif ( mmax == 24 )
    [ xnew, ynew, w ] = rule24 ( );
  elseif ( mmax == 25 )
    [ xnew, ynew, w ] = rule25 ( );
  elseif ( mmax == 26 )
    [ xnew, ynew, w ] = rule26 ( );
  elseif ( mmax == 27 )
    [ xnew, ynew, w ] = rule27 ( );
  elseif ( mmax == 28 )
    [ xnew, ynew, w ] = rule28 ( );
  elseif ( mmax == 29 )
    [ xnew, ynew, w ] = rule29 ( );
  elseif ( mmax == 30 )
    [ xnew, ynew, w ] = rule30 ( );
  elseif ( mmax == 31 )
    [ xnew, ynew, w ] = rule31 ( );
  elseif ( mmax == 32 )
    [ xnew, ynew, w ] = rule32 ( );
  elseif ( mmax == 33 )
    [ xnew, ynew, w ] = rule33 ( );
  elseif ( mmax == 34 )
    [ xnew, ynew, w ] = rule34 ( );
  elseif ( mmax == 35 )
    [ xnew, ynew, w ] = rule35 ( );
  elseif ( mmax == 36 )
    [ xnew, ynew, w ] = rule36 ( );
  elseif ( mmax == 37 )
    [ xnew, ynew, w ] = rule37 ( );
  elseif ( mmax == 38 )
    [ xnew, ynew, w ] = rule38 ( );
  elseif ( mmax == 39 )
    [ xnew, ynew, w ] = rule39 ( );
  elseif ( mmax == 40 )
    [ xnew, ynew, w ] = rule40 ( );
  elseif ( mmax == 41 )
    [ xnew, ynew, w ] = rule41 ( );
  elseif ( mmax == 42 )
    [ xnew, ynew, w ] = rule42 ( );
  elseif ( mmax == 43 )
    [ xnew, ynew, w ] = rule43 ( );
  elseif ( mmax == 44 )
    [ xnew, ynew, w ] = rule44 ( );
  elseif ( mmax == 45 )
    [ xnew, ynew, w ] = rule45 ( );
  elseif ( mmax == 46 )
    [ xnew, ynew, w ] = rule46 ( );
  elseif ( mmax == 47 )
    [ xnew, ynew, w ] = rule47 ( );
  elseif ( mmax == 48 )
    [ xnew, ynew, w ] = rule48 ( );
  elseif ( mmax == 49 )
    [ xnew, ynew, w ] = rule49 ( );
  elseif ( mmax == 50 )
    [ xnew, ynew, w ] = rule50 ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'QUAEQUAD0 - Fatal error!\n' );
    fprintf ( 1, '  Illegal input value of MMAX.\n' );
    fprintf ( 1, '  1 <= MMAX <= 50 required.\n' );
    error ( 'QUAEQUAD0 - Fatal error!' );
  end

  for i = 1 : kk
%
%  The lower-left 1/6.
%
    iitype = 2;
    nbool2 = quaeinside ( iitype, xnew(i), ynew(i) );
%
%  The lower 1/3.
%
    iitype = 1;
    nbool1 = quaeinside ( iitype, xnew(i), ynew(i) );
%
%  The whole triangle.
%
    iitype = 0;
    nbool0 = quaeinside ( iitype, xnew(i), ynew(i) );

    if ( nbool2 == 1 )

    elseif ( nbool1 == 1 )
      xnew(i) = -xnew(i);
      ynew(i) = ynew(i);
    elseif ( nbool0 == 1 )
      x0 = xnew(i);
      y0 = ynew(i);
      [ x1, y1 ] = quaerotate ( x0, y0 );
      xnew(i) = x1;
      ynew(i) = y1;
    else
      fprintf ( 1, '\n' );
      fprintf ( 1, 'QUAEQUAD0 - Fatal error!\n' );
      fprintf ( 1, '  Point does not lie inside triangle.\n' );
      error ( 'QUAEQUAD0 - Fatal error!' );
    end

  end

  return
end
