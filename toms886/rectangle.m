function rectangle

%*****************************************************************************80
%
%% MAIN is the main program for RECTANGLE.
%
%  Discussion:
%
%    This driver computes the interpolation of the Franke function
%    on the rectangle R(A,B) = [A1,B1] x [A2,B2] with A=(A1,A2)=(0,0) 
%    and B=(B1,B2)=(1,1) (unit square) at the FAMILY = 1 of Padua points. 
%
%    The degree of interpolation is DEG = 60 and the number of target 
%    points is NTG = NTG1^2, NTG1 = 100. 
%
%    The maps from the reference square [-1,1]^2 to the rectangle
%    are SIGMA1 and SIGMA2 with inverses ISIGM1 and ISIGM2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%  
%  Modified:
%
%    13 February 2014
%
%  Author:
%
%    Original FORTRAN77 version by Marco Caliari, Stefano De Marchi, 
%    Marco Vianello.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Marco Caliari, Stefano de Marchi, Marco Vianello,
%    Algorithm 886:
%    Padua2D: Lagrange Interpolation at Padua Points on Bivariate Domains,
%    ACM Transactions on Mathematical Software,
%    Volume 35, Number 3, October 2008, Article 21, 11 pages.
%
%  Parameters:
%
%    Local, integer DEGMAX, the maximum degree of interpolation.
%
%    Local, integer NPDMAX, the maximum number of Padua points
%    = (DEGMAX + 1) * (DEGMAX + 2) / 2.
%
%    Local, integer NTG1MX, the maximum value of the parameter determining 
%    the number of target points.
%
%    Local, integer NTGMAX, the maximum number of target points,
%    dependent on NTG1MX.
%
%    Local, integer DEG, the degree of interpolation,
%
%    Local, integer NTG1, the parameter determining the number 
%    of target points.
%
%    Local, integer FAMILY, specifies the desired family of Padua points.
%
%    Local, integer NPD, the number of Padua points = (DEG + 1) * (DEG + 2) / 2.
%
%    Local, integer NTG, the number of target points, dependent on NTG1.
%
%    Local, real PD1(NPDMAX), the first coordinates of 
%    the Padua points.
%
%    Local, real PD2(NPDMAX), the second coordinates of the 
%    Padua points.
%
%    Local, real WPD(NPDMAX), the weights.
%
%    Local, real FPD(NPDMAX), the function at the Padua points.
%
%    Workspace, real RAUX1(DEGMAX+1)*(DEGMAX+2)).
%
%    Workspace, real RAUX2(DEGMAX+1)*(DEGMAX+2)).
%
%    Local, real C0(0:DEGMAX+1,0:DEGMAX+1), the coefficient matrix.
%
%    Local, real TG1(NTGMAX), the first coordinates of the 
%    target points.
%
%    Local, real TG2(NTGMAX), the second coordinates of the 
%    target points.
%
%    Local, real INTFTG(NTGMAX), the values of the 
%    interpolated function.
%
%    Local, real MAXERR, the maximum norm of the error at target 
%    points.
%
%    Local, real ESTERR, the estimated error.
%
  degmax = 60;
  ntg1mx = 100;

  npdmax = round ( ( degmax + 1 ) * ( degmax + 2 ) / 2 );
  ntgmax = ntg1mx ^ 2;

  a1 = 0.0;
  a2 = 0.0;
  b1 = 1.0;
  b2 = 1.0;
  family = 1;
  deg = 60;
  ntg1 = 100;
 
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RECTANGLE:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Interpolation of the Franke function\n' );
  fprintf ( 1, '  on the unit square [0,1] x [0,1]\n' );
  fprintf ( 1, '  of degree = %d\n', deg );

  if ( degmax < deg )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'RECTANGLE - Fatal error!\n' );
    fprintf ( 1, '  DEGMAX < DEG.\n' );
    fprintf ( 1, '  DEG =    %d\n', deg );
    fprintf ( 1, '  DEGMAX = %d\n', degmax );
    error ( 'RECTANGLE - Fatal error!' );
  end
% 
%  Build the first family of Padua points in the square [-1,1]^2
%     
  [ pd1, pd2, wpd, npd ] = pdpts ( deg );
%     
%  Compute the Franke function at Padua points mapped to the region.
%
  for i = 1 : npd    
    x = sigma1 ( pd1(i), pd2(i), a1, a2, b1, b2, family, deg );
    y = sigma2 ( pd1(i), pd2(i), a1, a2, b1, b2, family, deg );
    fpd(i) = franke ( x, y );
  end
%
%  Write X, Y, F(X,Y) to a file.
%
  filename = 'rectangle_fpd.txt';
  output = fopen ( filename, 'wt' );
  for i = 1 : npd
    x = sigma1 ( pd1(i), pd2(i), a1, a2, b1, b2, family, deg );
    y = sigma2 ( pd1(i), pd2(i), a1, a2, b1, b2, family, deg );
    fprintf ( output, '%g  %g  %g\n', x, y, fpd(i) );
  end
  fclose ( output );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote F(x,y) at Padua points in "%s"\n', filename );
%     
%  Compute the matrix C0 of the coefficients in the bivariate
%  orthonormal Chebyshev basis
%     
  [ c0, esterr ] = padua2 ( deg, degmax, npd, wpd, fpd );
%     
%  Evaluate the target points in the region.
%     
  [ tg1, tg2, ntg ] = target ( a1, b1, a2, b2, ntg1, ntgmax );
%     
%  Evaluate the interpolant at the target points.
% 
  for i = 1 : ntg    
    x = isigm1 ( tg1(i), tg2(i), a1, a2, b1, b2, family, deg );
    y = isigm2 ( tg1(i), tg2(i), a1, a2, b1, b2, family, deg );
    intftg(i) = pd2val ( deg, degmax, c0, x, y );
  end
%
%  Write the function value at target points to a file.
%
  filename = 'rectangle_ftg.txt';
  output = fopen ( filename, 'wt' );
  for i = 1 : ntg
    fprintf ( output, '%g  %g  %g\n', tg1(i), tg2(i), franke ( tg1(i), tg2(i) ) );
  end
  fclose ( output );
  fprintf ( 1, '  Wrote F(x,y) at target points in "%s"\n', filename );
%
%  Write the interpolated function value at target points to a file.
%
  filename = 'rectangle_itg.txt';
  output = fopen ( filename, 'wt' );
  for i = 1 : ntg
    fprintf ( output, '%g  %g  %g\n', tg1(i), tg2(i), intftg(i) );
  end
  fclose ( output );
  fprintf ( 1, '  Wrote I(F)(x,y) at target points in "%s"\n', filename );
%  
%  Compute the error relative to the max deviation from the mean
%     
  maxerr = 0.0;
  mean = 0.0;
  fmax = - Inf;
  fmin = + Inf;

  for i = 1 : ntg
    fxy = franke ( tg1(i), tg2(i) );
    ixy = intftg(i);
    maxerr = max ( maxerr, abs ( fxy - ixy ) );
    mean = mean + fxy;
    fmax = max ( fmax, fxy );
    fmin = min ( fmin, fxy );
  end

  if ( fmax == fmin )
    maxdev = 1.0;
  else
    mean = mean / ntg;
    maxdev = max ( fmax - mean, mean - fmin );
  end
%
%  Print error ratios.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Estimated error:  %g\n', esterr / maxdev );
  fprintf ( 1, '  Actual error:     %g\n', maxerr / maxdev );
  fprintf ( 1, '  Expected error:   %g\n', 0.2468E-10 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RECTANGLE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = sigma1 ( t1, t2, a1, a2, b1, b2, family, deg )

%*****************************************************************************80
%
%% SIGMA1 maps first coordinate from square to the rectangle.
%
%  Discussion:
%
%    This function returns the first component of the map 
%    from the square [-1,1]^2 to the rectangle [A1,B1] x [A2,B2]. 
%    FAMILY and DEG select the rotation in order to get 
%    the corresponding FAMILY of Padua points at degree DEG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%  
%  Modified:
%
%    12 February 2014
%
%  Author:
%
%    Original FORTRAN77 version by Marco Caliari, Stefano De Marchi, 
%    Marco Vianello.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Marco Caliari, Stefano de Marchi, Marco Vianello,
%    Algorithm 886:
%    Padua2D: Lagrange Interpolation at Padua Points on Bivariate Domains,
%    ACM Transactions on Mathematical Software,
%    Volume 35, Number 3, October 2008, Article 21, 11 pages.
%
%  Parameters:
%
%    Input, real T1, T2, the coordinates of a point in the square.
%
%    Input, real A1, B1, A2, B2, the coordinates of the extreme
%    corners of the rectangle.
%
%    Input, integer FAMILY, DEG, select the family of Padua points at 
%    degree DEG.
%
%    Output, real VALUE, the X coordinate of the corresponding
%    point in the rectangle.
%
  theta = ( 2 * mod ( deg, 2 ) - 1 ) * ( family - 1 ) * pi / 2.0;
  value = t1 * cos ( theta ) - t2 * sin ( theta );
  value = ( ( b1 - a1 ) * value + ( b1 + a1 ) ) / 2.0;

  return
end
function value = isigm1 ( sigma1, sigma2, a1, a2, b1, b2, family, deg )

%*****************************************************************************80
%
%% ISIGM1 maps first coordinate from the rectangle to the square.
%
%  Discussion:
%
%    This function returns the first component of the map 
%    from the rectangle [A1,B1] x [A2,B2] to the square [-1,1]^2. 
%    FAMILY and DEG select the rotation in order to get 
%    the corresponding FAMILY of Padua points at degree DEG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%  
%  Modified:
%
%    13 February 2014
%
%  Author:
%
%    Original FORTRAN77 version by Marco Caliari, Stefano De Marchi, 
%    Marco Vianello.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Marco Caliari, Stefano de Marchi, Marco Vianello,
%    Algorithm 886:
%    Padua2D: Lagrange Interpolation at Padua Points on Bivariate Domains,
%    ACM Transactions on Mathematical Software,
%    Volume 35, Number 3, October 2008, Article 21, 11 pages.
%
%  Parameters:
%
%    Input, real SIGMA1, SIGMA2, the coordinates of a point 
%    in the rectangle.
%
%    Input, real A1, B1, A2, B2, the coordinates of the extreme
%    corners of the rectangle.
%
%    Input, integer FAMILY, DEG, select the family of Padua points at 
%    degree DEG.
%
%    Output, real VALUE, the X coordinate of the corresponding
%    point in the square.
%
  theta = ( 2 * mod ( deg, 2 ) - 1 ) * ( family - 1 ) * pi / 2.0;
  value = ( 2.0 * sigma1 - ( b1 + a1 ) ) / ( b1 - a1 );
  isigm2 = ( 2.0 * sigma2 - ( b2 + a2 ) ) / ( b2 - a2 );
  value = value * cos ( theta ) + isigm2 * sin ( theta );

  return
end
function value = sigma2 ( t1, t2, a1, a2, b1, b2, family, deg )

%*****************************************************************************80
%
%% SIGMA2 maps second coordinate from square to the rectangle.
%
%  Discussion:
%
%    This function returns the second component of the map 
%    from the square [-1,1]^2 to the rectangle [A1,B1] x [A2,B2]. 
%    FAMILY and DEG select the rotation in order to get 
%    the corresponding FAMILY of Padua points at degree DEG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%  
%  Modified:
%
%    13 February 2014
%
%  Author:
%
%    Original FORTRAN77 version by Marco Caliari, Stefano De Marchi, 
%    Marco Vianello.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Marco Caliari, Stefano de Marchi, Marco Vianello,
%    Algorithm 886:
%    Padua2D: Lagrange Interpolation at Padua Points on Bivariate Domains,
%    ACM Transactions on Mathematical Software,
%    Volume 35, Number 3, October 2008, Article 21, 11 pages.
%
%  Parameters:
%
%    Input, real T1, T2, the coordinates of a point in the square.
%
%    Input, real A1, B1, A2, B2, the coordinates of the extreme
%    corners of the rectangle.
%
%    Input, integer FAMILY, DEG, select the family of Padua points at 
%    degree DEG.
%
%    Output, real VALUE, the Y coordinate of the corresponding
%    point in the rectangle.
%
  theta = ( 2 * mod ( deg, 2 ) - 1 ) * ( family - 1 ) * pi / 2.0;
  value = t1 * sin ( theta ) + t2 * cos ( theta );
  value = ( ( b2 - a2 ) * value + ( b2 + a2 ) ) / 2.0;

  return
end
function value = isigm2 ( sigma1, sigma2, a1, a2, b1, b2, family, deg )

%*****************************************************************************80
%
%% ISIGM2 maps the second coordinate from the rectangle to the square.
%
%  Discussion:
%
%    This function returns the second component of the map 
%    from the rectangle [A1,B1] x [A2,B2] to the square [-1,1]^2. 
%
%    FAMILY and DEG select the rotation in order to get 
%    the corresponding FAMILY of Padua points at degree DEG.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%  
%  Modified:
%
%    13 February 2014
%
%  Author:
%
%    Original FORTRAN77 version by Marco Caliari, Stefano De Marchi, 
%    Marco Vianello.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Marco Caliari, Stefano de Marchi, Marco Vianello,
%    Algorithm 886:
%    Padua2D: Lagrange Interpolation at Padua Points on Bivariate Domains,
%    ACM Transactions on Mathematical Software,
%    Volume 35, Number 3, October 2008, Article 21, 11 pages.
%
%  Parameters:
%
%    Input, real SIGMA1, SIGMA2, the coordinates of a point 
%    in the ellipse.
%
%    Input, real A1, B1, A2, B2, the coordinates of the extreme
%    corners of the rectangle.
%
%    Input, integer FAMILY, DEG, select the family of Padua points at 
%    degree DEG.
%
%    Output, real VALUE, the Y coordinate of the corresponding
%    point in the rectangle.
%
  theta = ( 2 * mod ( deg, 2 ) - 1 ) * ( family - 1 ) * pi / 2.0;
  isigm1 = ( 2.0 * sigma1 - ( b1 + a1 ) ) / ( b1 - a1 );
  value = ( 2.0 * sigma2 - ( b2 + a2 ) ) / ( b2 - a2 );
  value = - isigm1 * sin ( theta ) + value * cos ( theta );

  return
end
function [ tg1, tg2, ntg ] = target ( a1, b1, a2, b2, ntg1, ntgmax )

%*****************************************************************************80
%
%% TARGET returns the target points on the rectangle.
%
%  Discussion:
%
%    Target points (uniform grid) on the rectangle [A1,B1] x [A2,B2].
%    The number of target points is NTG = NTG1^2.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%  
%  Modified:
%
%    13 February 2014
%
%  Author:
%
%    Original FORTRAN77 version by Marco Caliari, Stefano De Marchi, 
%    Marco Vianello.
%    This MATLAB version by John Burkardt.
%
%  Reference:
%
%    Marco Caliari, Stefano de Marchi, Marco Vianello,
%    Algorithm 886:
%    Padua2D: Lagrange Interpolation at Padua Points on Bivariate Domains,
%    ACM Transactions on Mathematical Software,
%    Volume 35, Number 3, October 2008, Article 21, 11 pages.
%
%  Parameters:
%
%    Input, real A1, B1, A2, B2, the coordinates of the extreme
%    corners of the rectangle.
%
%    Input, integer NTG1, a parameter determining the number 
%    of target points
%
%    Input, integer NTGMAX, the maximum number of target points.
%
%    Output, real TG1(NTG), TG2(NTG), the X and Y coordinates
%    of the target points.
%
%    Output, integer NTG, the number of target points computed.
%
  if ( ntg1 < 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TARGET - Fatal error!\n' );
    fprintf ( 1, '  NTG1 < 2\n' );
    fprintf ( 1, '  NTG1 = %d\n', ntg1 );
    error ( 'TARGET - Fatal error!' );
  end    

  if ( ntgmax < ntg1 * ntg1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TARGET - Fatal error\n' );
    fprintf ( 1, '  NTGMAX < NTG1 * NTG1.\n' );
    fprintf ( 1, '  NTG1 = %d\n', ntg1 );
    fprintf ( 1, '  NTGMAX = %d\n', ntgmax );
    error ( 'TARGET - Fatal error!' );
  end
  
  ntg = 0;
  for i = 1 : ntg1
    for j = 1 : ntg1
      ntg = ntg + 1;
      tg1(ntg) = a1 + ( j - 1 ) * ( b1 - a1 ) / ( ntg1 - 1 );
      tg2(ntg) = a2 + ( i - 1 ) * ( b2 - a2 ) / ( ntg1 - 1 );
    end
  end

  return
end
