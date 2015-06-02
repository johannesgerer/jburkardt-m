function w = padua_weights ( l )

%*****************************************************************************80
%
%% PADUA_WEIGHTS returns quadrature weights for Padua points.
%
%  Discussion:
%
%    The order of the weights corresponds to the ordering used
%    by the companion function padua_points().
%
%    Caliari, de Marchi and Vianello supplied a MATLAB code pdwtsMM
%    which carries out this same computation in a way that makes
%    more efficient use of MATLAB's vector and matrix capabilities.  
%    This version of the computation was painfully rewritten to display 
%    the individual scalar computations, so that it could be translated
%    into other languages.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 June 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Marco Caliari, Stefano de Marchi, Marco Vianello,
%    Bivariate interpolation on the square at new nodal sets,
%    Applied Mathematics and Computation,
%    Volume 165, Number 2, 2005, pages 261-274.
%
%  Parameters:
%
%    Input, integer L, the level of the set.
%    0 <= L
%
%    Output, real W((L+1)*(L+2)/2), the quadrature weights.
%
  if ( l == 0 )
    w = 4.0;
    return
  end
%
%  Relatives of L/2:
%
  lp1h = floor ( ( l + 1 ) / 2 );
  lp2h = floor ( ( l + 2 ) / 2 );
  lp3h = floor ( ( l + 3 ) / 2 );
%
%  TE1, TE2, TO1, TO2: 
%  Even and odd Chebyshev polynomials on subgrids 1 and 2.
%
  te1 = zeros(lp2h,lp2h);
  for j = 1 : lp2h
    for i = 1 : lp2h
      te1(i,j) = cos ( 2 * ( i - 1 ) * ( 2 * j - 2 ) * pi / l );
    end
  end
  te1(2:lp2h,1:lp2h) = te1(2:lp2h,1:lp2h) * sqrt ( 2.0 );

  to1 = zeros(lp2h,lp1h);
  for j = 1 : lp1h
    for i = 1 : lp2h
      to1(i,j) = cos ( 2 * ( i - 1 ) * ( 2 * j - 1 ) * pi / l );
    end
  end
  to1(2:lp2h,1:lp1h) = to1(2:lp2h,1:lp1h) * sqrt ( 2.0 );

  te2 = zeros(lp2h,lp3h);
  for j = 1 : lp3h
    for i = 1 : lp2h
      te2(i,j) = ...
        cos ( 2 * ( i - 1 ) * ( 2 * j - 2 ) * pi / ( l + 1 ) );
    end
  end
  te2(2:lp2h,1:lp3h) = te2(2:lp2h,1:lp3h) * sqrt ( 2.0 );

  to2 = zeros(lp2h,lp2h);
  for j = 1 : lp2h
    for i = 1 : lp2h
      to2(i,j) = ...
        cos ( 2 * ( i - 1 ) * ( 2 * j - 1 ) * pi / ( l + 1 ) );
    end
  end
  to2(2:lp2h,1:lp2h) = to2(2:lp2h,1:lp2h) * sqrt ( 2.0 );
%
%  MOM: Moments matrix for even * even pairs.
%
  mom = zeros(lp2h,lp2h);

  for j = 1 : lp2h
    mj = 2.0 * sqrt ( 2.0 ) / ( 1.0 - ( 2 * j - 2 ) ^2 );
    for i = 1 : lp2h + 1 - j
      mi = 2.0 * sqrt ( 2.0 ) / ( 1.0 - ( 2 * i - 2 ) ^2 );
      mom(i,j) = mi * mj;
    end
  end

  mom(1,1:lp2h) = mom(1,1:lp2h) / sqrt ( 2.0 );
  mom(1:lp2h,1) = mom(1:lp2h,1) / sqrt ( 2.0 );

  if ( mod ( l, 2 ) == 0 )
    mom(lp2h,1) = mom(lp2h,1) / 2.0;
  end
%
%  TMTOE and TMTEO: matrix products.
%
  tmtoe = zeros(lp2h,lp2h);

  for j2 = 1 : lp2h
    for i2 = 1 : lp2h+1-j2
      for j = 1 : lp2h
        for i = 1 : lp2h
          tmtoe(i,j) = tmtoe(i,j) + to2(i2,i) * mom(j2,i2) * te1(j2,j);
        end
      end
    end
  end

  tmteo = zeros(lp3h,lp1h);

  for j2 = 1 : lp2h
    for i2 = 1 : lp2h+1-j2
      for j = 1 : lp1h
        for i = 1 : lp3h
          tmteo(i,j) = tmteo(i,j) + te2(i2,i) * mom(j2,i2) * to1(j2,j);
        end
      end
    end
  end
%
%  W1 and W2: Interpolation weight matrices.
%
  w1 = 2.0 * ones(lp2h,lp2h) / ( l * ( l + 1 ) );

  w1(1:lp2h,1) = w1(1:lp2h,1) / 2.0;

  if ( mod ( l, 2 ) == 0 )
    w1(1:lp2h,lp2h) = w1(1:lp2h,lp2h) / 2.0;
    w1(lp2h,1:lp2h) = w1(lp2h,1:lp2h) / 2.0;
  end

  w2 = 2.0 * ones(lp3h,lp1h) / ( l * ( l + 1 ) );
  w2(1,1:lp1h) = w2(1,1:lp1h) / 2.0;

  if ( mod ( l, 2 ) == 1 )
    w2(lp3h,1:lp1h) = w2(lp3h,1:lp1h) / 2.0;
    w2(1:lp3h,lp1h) = w2(1:lp3h,lp1h) / 2.0;
  end
%
%  Cubature weights as matrices on the subgrids.
%
  for j = 1 : lp2h
    for i = 1 : lp2h
      w1(i,j) = w1(i,j) * tmtoe(i,j);
    end
  end

  for j = 1 : lp1h
    for i = 1 : lp3h
      w2(i,j) = w2(i,j) * tmteo(i,j);
    end
  end
%
%  Pack weight matrices W1 and W2 into the vector W.
%
  n = ( ( l + 1 ) * ( l + 2 ) ) / 2;
  w = zeros(n,1);

  if ( mod ( l, 2 ) == 0 )

    for i = 1 : lp2h
      for j = 1 : lp2h
        w(i+(2*j-2)*lp2h) = w1(i,j);
      end
    end

    for i = 1 : lp3h
      for j = 1 : lp1h
        w(i+(2*j-1)*lp2h) = w2(i,j);
      end
    end

  else

    for j = 1 : lp1h
      for i = 1 : lp2h
        w(i+(j-1)*(l+2)) = w1(i,j);
      end
    end

    for j = 1 : lp1h
      for i = 1 : lp3h
        w(i+lp2h+(j-1)*(l+2)) = w2(i,j);
      end
    end

  end

  return
end

