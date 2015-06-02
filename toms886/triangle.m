function triangle ( )

%*****************************************************************************80
%
%% MAIN is the main program for TRIANGLE.
%
%  Discussion:
%
%    This driver computes the interpolation of the Franke function
%    on the triangle T(U,V,W) with vertices U=(U1,U2)=(0,0), 
%    V=(V1,V2)=(1,0) and W=(W1,W2)=(0,1) (unit triangle) 
%    at the first family of Padua points. 
%
%    The degree of interpolation is DEG = 60 and the number of target 
%    points is NTG = NTG1 ** 2 - NTG1 + 1, NTG1 = 100.
%
%    The maps from the reference square [-1,1]^2 to the triangle
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
%    Local, integer DEG, the degree of interpolation.
%
%    Local, integer NTG1, the parameter determining the number 
%   of target points.
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
  ntgmax = ntg1mx * ntg1mx - ntg1mx + 1;

  u1 = 0.0;
  u2 = 0.0;
  v1 = 1.0;
  v2 = 0.0;
  w1 = 0.0;
  w2 = 1.0;
  family = 1;
  deg = 60;
  ntg1 = 100;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Interpolation of the Franke function\n' );
  fprintf ( 1, '  on the unit triangle T((0,0),(1,0),(0,1))\n' );
  fprintf ( 1, '  at degree = %d\n', deg );

  if ( degmax < deg )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TRIANGLE - Fatal error!\n' );
    fprintf ( 1, '  DEGMAX < DEG.\n' );
    fprintf ( 1, '  DEG =    %d\n', deg );
    fprintf ( 1, '  DEGMAX = %d\n', degmax );
    error ( 'TRIANGLE - Fatal error!' );
  end
%
%  Build the first family of Padua points in the square [-1,1]^2
%     
  [ pd1, pd2, wpd, npd ] = pdpts ( deg );
%     
%  Compute the Franke function at Padua points mapped to T(U,V,W).
%   
  for i = 1 : npd
    x = sigma1 ( pd1(i), pd2(i), u1, u2, v1, v2, w1, w2 );
    y = sigma2 ( pd1(i), pd2(i), u1, u2, v1, v2, w1, w2 );
    fpd(i) = franke ( x, y );
  end
%
%  Write X, Y, F(X,Y) to a file.
%
  filename = 'triangle_fpd.txt';
  output = fopen ( filename, 'wt' );
  for i = 1 : npd
    x = sigma1 ( pd1(i), pd2(i), u1, u2, v1, v2, w1, w2 );
    y = sigma2 ( pd1(i), pd2(i), u1, u2, v1, v2, w1, w2 );
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
%  Build the set of target points on T(U,V,W)
%     
  [ tg1, tg2, ntg ] = target ( u1, u2, v1, v2, w1, w2, ntg1, ntgmax );
%     
%  Evaluate the interpolant at the target points.
%    
  for i = 1 : ntg
    x = isigm1 ( tg1(i), tg2(i), u1, u2, v1, v2, w1, w2 );
    y = isigm2 ( tg1(i), tg2(i), u1, u2, v1, v2, w1, w2 );
    intftg(i) = pd2val ( deg, degmax, c0, x, y );
  end
%
%  Write the function value at target points to a file.
%
  filename = 'triangle_ftg.txt';
  output = fopen ( filename, 'wt' );
  for i = 1 : ntg
    fprintf ( output, '%g  %g  %g\n', tg1(i), tg2(i), franke ( tg1(i), tg2(i) ) );
  end
  fclose ( output );
  fprintf ( 1, '  Wrote F(x,y) at target points in "%s"\n', filename );
%
%  Write the interpolated function value at target points to a file.
%
  filename = 'triangle_itg.txt';
  output = fopen ( filename, 'wt' );
  for i = 1 : ntg
    fprintf ( output, '%g  %g  %g\n', tg1(i), tg2(i), intftg(i) );
  end
  fclose ( output );
  fprintf ( 1, '  Wrote I(F)(x,y) at target points in "%s"\n', filename );
%
%  Compute the error relative to the max deviation from the mean.
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
  fprintf ( 1, '  Expected error:   %g\n', 0.1226E-09 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TRIANGLE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = sigma1 ( t1, t2, u1, u2, v1, v2, w1, w2 )

%*****************************************************************************80
%
%% SIGMA1 maps first coordinate from square to triangle.
%
%  Discussion:
%
%    This function returns the first component of the map
%    from the square [-1,1]^2 to the triangle T(U,V,W). 
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
%    Input, real U1, U2, V1, V2, W1, W2, the coordinates of the 
%    vertices of the triangle.
%
%    Output, real VALUE, the X coordinate of the corresponding
%    point in the triangle.
%
  value = ( v1 - u1 ) * ( 1.0 + t1 ) ...
    * ( 1.0 - t2 ) / 4.0 ...
    + ( w1 - u1 ) * ( 1.0 + t2 ) / 2.0 + u1;

  return
end
function value = isigm1 ( sigma1, sigma2, u1, u2, v1, v2, w1, w2 )

%*****************************************************************************80
%
%% ISIGM1 maps first coordinate from triangle to the square.
%
%  Discussion:
%
%    This functions returns the first component of the map
%    from the the triangle T(U,V,W) to the square [-1,1]^2.
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
%    in the triangle.
%
%    Input, real U1, U2, V1, V2, W1, W2, the coordinates of the 
%    vertices of the triangle.
%
%    Output, real VALUE, the X coordinate of the corresponding
%    point in the square.
%
  rho1 = ( sigma1 * ( w2 - u2 ) - sigma2 * ( w1 - u1 ) ...
    + ( w1 - u1 ) * u2 - ( w2 - u2 ) * u1 ) / ...
    ( ( v1 - u1 ) * ( w2 - u2 ) - ( v2 - u2 ) * ( w1 - u1 ) );

  rho2 = ( sigma1 * ( v2 - u2 ) - sigma2 * ( v1 - u1 ) ...
    + ( v1 - u1 ) * u2 - ( v2 - u2 ) * u1 ) / ...
    ( ( w1 - u1 ) * ( v2 - u2 ) - ( w2 - u2 ) * ( v1 - u1 ) );

  if ( rho2 == 1.0 )
    value = 0.0;
  else
    value = 2.0 * rho1 / ( 1.0 - rho2 ) - 1.0;
  end  
 
  return
end
function value = sigma2 ( t1, t2, u1, u2, v1, v2, w1, w2 )

%*****************************************************************************80
%
%% SIGMA2 maps the second coordinate from square to triangle.
%
%  Discussion:
%
%    This functions returns the second component of the map
%    from the square [-1,1]^2 to the triangle T(U,V,W).
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
%    Input, real U1, U2, V1, V2, W1, W2, the coordinates of the 
%    vertices of the triangle.
%
%    Output, real VALUE, the Y coordinate of the corresponding
%    point in the triangle.
%
  value = ( v2 - u2 ) * ( 1.0 + t1 ) ...
    * ( 1.0 - t2 ) / 4.0 + ( w2 - u2 ) ...
    * ( 1.0 + t2 ) / 2.0 + u2;

  return
end
function value = isigm2 ( sigma1, sigma2, u1, u2, v1, v2, w1, w2 )

%*****************************************************************************80
%
%% ISIGM2 maps second coordinate from triangle to the square.
%
%  Discussion:
%
%    This functions returns the second component of the map
%    from the the triangle T(U,V,W) to the square [-1,1]^2.
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
%    Input, real U1, U2, V1, V2, W1, W2, the coordinates of the 
%    vertices of the triangle.
%
%    Output, real VALUE, the Y coordinate of the corresponding
%    point in the triangle.
%
  rho2 = ( sigma1 * ( v2 - u2 ) - ...
    sigma2 * ( v1 - u1) + ( v1 - u1 ) * u2 - ( v2 - u2 ) * u1 ) / ...
    ( ( w1 - u1 ) * ( v2 - u2 ) - ( w2 - u2 ) * ( v1 - u1 ) );

  if ( rho2 == 1.0 )
    value = 1.0;
  else
    value = 2.0 * rho2 - 1.0;
  end 
  
  return
end
function [ tg1, tg2, ntg ] = target ( u1, u2, v1, v2, w1, w2, ntg1, ntgmax )

%*****************************************************************************80
%
%% TARGET returns the target points on the triangle.
%
%  Discussion:
%
%    Target points on the triangle T(U,V,W).
%    The number of target points is NTG = NTG1^2 - NGT1 + 1.
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
%    Input, real U1, U2, V1, V2, W1, W2, the coordinates of the 
%    vertices of the triangle.
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
   
  if ( ntgmax < ntg1 * ntg1 - ntg1 + 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TARGET - Fatal error!\n' );
    fprintf ( 1, '  NTGMAX < NTG1 * NTG1 - NTG1 + 1.\n' );
    fprintf ( 1, '  NTG1 = %d\n', ntg1 );
    fprintf ( 1, '  NTGMAX = %d\n', ntgmax );
    error ( 'TARGET - Fatal error!' );
  end    

  ntg = 0;
  for i = 1 : ntg1 - 1
    for j = 1 : ntg1

      ntg = ntg + 1;

      tg1(ntg) = ( v1 - u1 ) * ( i - 1 ) / ( ntg1 - 1 ) ...
        + ( w1 - u1 ) * ( ( j - 1 ) / ( ntg1 - 1 ) ) ...
        * ( 1.0 - ( i - 1 ) / ( ntg1 - 1 ) ) + u1;

      tg2(ntg) = ( v2 - u2 ) * ( i - 1 ) / ( ntg1 - 1 ) ...
        + ( w2 - u2 ) * ( ( j - 1 ) / ( ntg1 - 1 ) ) ...
        * ( 1.0 - ( i - 1 ) / ( ntg1 - 1 ) ) + u2;

    end
  end

  i = ntg1;
  j = 1;
  ntg = ntg + 1;

  tg1(ntg) = ( v1 - u1 ) * ( i - 1 ) / ( ntg1 - 1 ) ...
    + ( w1 - u1 ) * ( ( j - 1 ) / ( ntg1 - 1 ) ) ...
    * ( 1.0 - ( i - 1 ) / ( ntg1 - 1 ) ) + u1;

  tg2(ntg) = ( v2 - u2 ) * ( i - 1 ) / ( ntg1 - 1 ) ...
    + ( w2 - u2 ) * ( ( j - 1 ) / ( ntg1 - 1 ) ) ...
    * ( 1.0 - ( i - 1 ) / ( ntg1 - 1 ) ) + u2;

  return
end
