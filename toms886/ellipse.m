function ellipse ( )

%*****************************************************************************80
%
%% ELLIPSE is the main program for the ELLIPSE code.
%
%  Discussion:
%
%    ELLIPSE computes the interpolation of the Franke function
%    on the ellipse E((C1,C2),ALPHA,BETA) = E((0.5,0.5),0.5,0.5)  
%    at the first family of Padua points. 
%
%    The ellipse has the equation:
%
%      ( ( X - C1 ) / ALPHA )^2 + ( ( Y - C2 ) / BETA )^2 = 1
%
%    The degree of interpolation DEG = 60 and the number of target 
%    points is NTG = NTG1 ^ 2 - 2 * NTG1 + 2, NTG1 = 100.  
%
%    The maps from the reference square [-1,1]^2 to the current domain 
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
%  Local Parameters:
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
%    Local, integer NTG1, the parameter determining the number of target points.
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
%    Local, real C0(0+1:DEGMAX+2,1:DEGMAX+2), the coefficient matrix.
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
  ntgmax = ntg1mx * ntg1mx - 2 * ntg1mx + 2;

  alpha = 0.5;
  beta = 0.5;
  c1 = 0.5;
  c2 = 0.5;
  family = 1;
  deg = 60;
  ntg1 = 100;

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELLIPSE:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Interpolation of the Franke function\n' );
  fprintf ( 1, '  on the disk with center = (0.5,0.5) and radius = 0.5\n' );
  fprintf ( 1, '  of degree = %d\n', deg );

  if ( degmax < deg )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ELLIPSE - Fatal error!\n' );
    fprintf ( 1, '  DEGMAX < DEG.\n' );
    fprintf ( 1, '  DEG =    %d\n', deg );
    fprintf ( 1,  '  DEGMAX = %d\n', degmax );
    error ( 'ELLIPSE - Fatal error!' );
  end
%     
%  Build the first family of Padua points in the square [-1,1]^2.
%   
  [ pd1, pd2, wpd, npd ] = pdpts ( deg );
%     
%  Compute the Franke function at Padua points mapped to the region.
%  
  for i = 1 : npd
    x = sigma1 ( pd1(i), pd2(i), c1, c2, alpha, beta );
    y = sigma2 ( pd1(i), pd2(i), c1, c2, alpha, beta );
    fpd(i) = franke ( x, y );
  end
%
%  Write X, Y, F(X,Y) to a file.
%
  filename = 'ellipse_fpd.txt';
  output = fopen ( filename, 'wt' );
  for i = 1 : npd
    x = sigma1 ( pd1(i), pd2(i), c1, c2, alpha, beta );
    y = sigma2 ( pd1(i), pd2(i), c1, c2, alpha, beta );
    fprintf ( output, '%g  %g  %g\n', x, y, fpd(i) );
  end
  fclose ( output );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Wrote F(x,y) at Padua points in "%s"\n', filename );
%     
%  Compute the matrix C0 of the coefficients in the bivariate
%  orthonormal Chebyshev basis.
%    
  [ c0, esterr ] = padua2 ( deg, degmax, npd, wpd, fpd );
%     
%  Evaluate the target points in the region.
%     
  [ tg1, tg2, ntg ] = target ( c1, c2, alpha, beta, ntg1, ntgmax );
%     
%  Evaluate the interpolant at the target points.
%    
  for i = 1 : ntg
    x = isigm1 ( tg1(i), tg2(i), c1, c2, alpha, beta );
    y = isigm2 ( tg1(i), tg2(i), c1, c2, alpha, beta );
    intftg(i) = pd2val ( deg, degmax, c0, x, y );
  end
%
%  Write the function value at target points to a file.
%
  filename = 'ellipse_ftg.txt';
  output = fopen ( filename, 'wt' );
  for i = 1 : ntg
    fprintf ( output, '%g  %g  %g\n', tg1(i), tg2(i), franke ( tg1(i), tg2(i) ) );
  end
  fclose ( output );
  fprintf ( 1, '  Wrote F(x,y) at target points in "%s"\n', filename );
%
%  Write the interpolated function value at target points to a file.
%
  filename = 'ellipse_itg.txt';
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
  fprintf ( 1, '  Expected error:   %g\n', 0.1769E-09 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'ELLIPSE:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end
function value = sigma1 ( t1, t2, c1, c2, alpha, beta )

%*****************************************************************************80
%
%% SIGMA1 maps first coordinate from square to ellipse.
%
%  Discussion:
%
%    This function returns the first component of the map 
%    from the square [-1,1]^2 to the ellipse E((C1,C2),ALPHA,BETA).
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
%    Input, real C1, C2, ALPHA, BETA, the center and scale
%    parameters of the ellipse.
%
%    Output, real VALUE, the X coordinate of the corresponding
%    point in the ellipse.
%
  value = c1 - alpha * t2 * sin ( phi ( t1 ) );

  return
end
function value = isigm1 ( sigma1, sigma2, c1, c2, alpha, beta )

%*****************************************************************************80
%
%% ISIGM1 maps the first coordinate from the ellipse to the square.
%
%  Discussion:
%
%    This function returns the first component of the map 
%    from the ellipse E((C1,C2),ALPHA,BETA) to the square [-1,1]^2. 
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
%    Input, real C1, C2, ALPHA, BETA, the center and scale
%    parameters of the ellipse.
%
%    Output, real VALUE, the X coordinate of the corresponding
%    point in the square.
%
  if ( sigma2 == c2 )
    value = 1.0;
  else
    value = iphi ( atan ( beta * ( c1 - sigma1 ) / ...
      ( alpha * ( sigma2 - c2 ) ) ) );
  end

  return
end
function value = sigma2 ( t1, t2, c1, c2, alpha, beta )

%*****************************************************************************80
%
%% SIGMA2 maps the second coordinate from square to ellipse.
%
%  Discussion:
%
%    This function returns the second component of the map 
%    from the square [-1,1]^2 to the ellipse E((C1,C2),ALPHA,BETA).
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
%    Input, real C1, C2, ALPHA, BETA, the center and scale
%    parameters of the ellipse.
%
%    Output, real VALUE, the Y coordinate of the corresponding
%    point in the ellipse.
%
  value = c2 + beta * t2 * cos ( phi ( t1 ) );

  return
end
function value = isigm2 ( sigma1, sigma2, c1, c2, alpha, beta )

%*****************************************************************************80
%
%% ISIGM2 maps second coordinate from ellipse to the square.
%
%  Discussion:
%
%    This function returns the second component of the map 
%    from the ellipse E((C1,C2),ALPHA,BETA) to the square [-1,1]^2. 
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
%    Input, real C1, C2, ALPHA, BETA, the center and scale
%    parameters of the ellipse.
%
%    Output, real VALUE, the Y coordinate of the corresponding
%    point in the square.
%
  if ( sigma2 == c2 )
    value = ( c1 - sigma1 ) / alpha;
  else
    value = sqrt ( beta * beta * ( c1 - sigma1 ) ^ 2 + ...
      alpha * alpha * ( c2 - sigma2 ) ^ 2 ) / ( alpha * beta ) * ...
      r8_sign ( sigma2 - c2 );
  end

  return
end
function value = phi ( x )

%*****************************************************************************80
%
%% PHI maps from [-1,+1] to [-pi/2,+pi/2].
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
%    Input, real X, a point in [-1,+1];
%
%    Output, real VALUE, a corresponding point in [-pi/2,+pi/2].
%
  value = pi * x / 2.0;

  return
end
function value = iphi ( x )

%*****************************************************************************80
%
%% IPHI maps from [-pi/2,+pi/2] to [-1,+1].
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
%    Input, real X, a point in [-pi/2,+pi/2].
%
%    Output, real VALUE, a corresponding point in [-1,+1].
%
  value = 2.0 * x / pi;

  return
end
function [ tg1, tg2, ntg ] = target ( c1, c2, alpha, beta, ntg1, ntgmax )

%*****************************************************************************80
%
%% TARGET returns the target points on the ellipse.
%
%  Discussion:
%
%    Target points on the ellipse E((C1,C2),ALPHA,BETA).
%    The number of target points is NTG = NTG1^2 - 2 * NTG1 + 2.
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
%    Input, real C1, C2, ALPHA, BETA, the center and scale
%    parameters of the ellipse.
%
%    Input, integer NTG1, a parameter determining the number 
%    of target points.  2 <= NTG1.
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

  if ( ntgmax < ntg1 * ntg1 - 2 * ntg1 + 2 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'TARGET - Fatal error!\n' );
    fprintf ( 1, '  NTGMAX < NTG1 * NTG1 - 2 * NTG1 + 2.\n' );
    fprintf ( 1, '  NTG1 = %d\n', ntg1 );
    fprintf ( 1, '  NTGMAX = %d\n', ntgmax );
    error ( 'TARGET - Fatal error!' );
  end      

  i = 1;
  j = 1;
  ntg = 0;
  ntg = ntg + 1;

  tg1(ntg) = alpha * ...
    ( - 1.0 + ( i - 1 ) * 2.0 ...
    / ( ntg1 - 1 ) ) + c1;

  tg2(ntg) =  beta * ...
    ( - 1.0 + ( j - 1 ) * 2.0 ...
    / ( ntg1 - 1 ) ) * ...
    sqrt ( 1.0 - ( - 1.0 + ( i - 1 ) * 2.0 ...
    / ( ntg1 - 1 ) ) ^ 2 ) ...
    + c2;

  for i = 2 : ntg1 - 1
    for j = 1: ntg1
      ntg = ntg + 1;

      tg1(ntg) = alpha * ...
        ( - 1.0 + ( i - 1 ) * 2.0 ...
        / ( ntg1 - 1 ) ) + c1;

      tg2(ntg) =  beta * ...
        ( - 1.0 + ( j - 1 ) * 2.0 ...
        / ( ntg1 - 1 ) ) * ...
        sqrt ( 1.0 - ( - 1.0 + ( i - 1 ) ...
        * 2.0 / ( ntg1 - 1 ) ) ^ 2 ) ...
        + c2;

    end
  end

  i = ntg1;
  j = 1;
  ntg = ntg + 1;

  tg1(ntg) = alpha * ...
    ( -1.0 + ( i - 1 ) * 2.0 ...
    / ( ntg1 - 1 ) ) + c1;

  tg2(ntg) = beta * ...
    ( -1.0 + ( j - 1 ) * 2.0 ...
    / ( ntg1 - 1 ) ) * ...
    sqrt ( 1.0 - ( - 1.0 + ( i - 1 ) * 2.0 ...
    / ( ntg1 - 1 ) ) ^ 2 ) ...
    + c2;

  return
end
