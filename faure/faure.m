function [ quasi, seed ] = faure ( dim_num, seed )

%*****************************************************************************80
%
%% FAURE generates a new quasirandom Faure vector with each call.
%
%  Discussion:
%
%    This routine implements a method of Henri Faure for computing
%    quasirandom numbers.  It is a merging and adaptation of
%    the routines INFAUR and GOFAUR from ACM TOMS 647.
%
%    Thanks to Ernst Kloppenburg for suggesting the use of persistent
%    variables to improve the MATLAB implementation.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 June 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Henri Faure,
%    Discrepance de suites associees a un systeme de numeration
%    (en dimension s),
%    Acta Arithmetica,
%    Volume 41, 1982, pages 337-351, especially page 342.
%
%    Bennett Fox,
%    Algorithm 647:
%    Implementation and Relative Efficiency of Quasirandom
%    Sequence Generators,
%    ACM Transactions on Mathematical Software,
%    Volume 12, Number 4, pages 362-376, 1986.
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension, which should be
%    at least 2.
%
%    Input, integer SEED, the seed, which indicates the index of the
%    element of the sequence to be calculated.  If SEED is negative,
%    it is effectively replaced by a more suitable value.
%
%    Output, real QUASI(DIM_NUM), the next quasirandom vector.
%
%    Output, integer SEED, the appropriate value of SEED to be
%    used on the next call, if the next element of the sequence is desired.
%
  persistent coef;
  persistent hisum_save;
  persistent qs;
  persistent ytemp;
%
%  If the internal variable QS has never been set, then its SIZE is zero.
%
  if ( size ( qs ) == 0 | seed <= 0 )
    qs = prime_ge ( dim_num );
    hisum_save = -1;
  end
%
%  If SEED < 0, reset for recommended initial skip.
%
  if ( seed < 0 )
    hisum = 3;
    seed = qs^(hisum+1) - 1;
  elseif ( seed == 0 )
    hisum = 0;
  else

    hisum = i4_log_i4 ( seed, qs );

  end
%
%  Is it necessary to recompute the coefficient table?
%
  if ( hisum_save < hisum )

    hisum_save = hisum;

    coef = binomial_table ( qs, hisum, hisum );

  end
%
%  Find QUASI(1) using the method of Faure.
%
%  SEED has a representation in base QS of the form:
%
%    Sum ( 0 <= J <= HISUM ) YTEMP(J) * QS^J
%
%  We now compute the YTEMP(J)'s.
%
  ktemp = qs^( hisum + 1 );
  ltemp = seed;
  for i = hisum : -1 : 0
    ktemp = ktemp / qs;
    mtemp = mod ( ltemp, ktemp );
    ytemp(i+1) = ( ltemp - mtemp ) / ktemp;
    ltemp = mtemp;
  end
%
%  QUASI(K) has the form
%
%    Sum ( 0 <= J <= HISUM ) YTEMP(J) / QS**(J+1)
%
%  Compute QUASI(1) using nested multiplication.
%
  r = ytemp(hisum+1);
  for i = hisum - 1 : -1 : 0
    r = ytemp(i+1) + r / qs;
  end

  quasi(1) = r / qs;
%
%  Find components QUASI(2:DIM_NUM) using the Faure method.
%
  for k = 2 : dim_num

    quasi(k) = 0.0;
    r = 1.0 / qs;

    for j = 0 : hisum

      ztemp = ytemp(j+1:hisum+1) * coef(j+1:hisum+1,j+1);
%
%  New YTEMP(J) is:
%
%    Sum ( J <= I <= HISUM ) ( old ytemp(i) * binom(i,j) ) mod QS.
%
      ytemp(j+1) = mod ( ztemp, qs );
      quasi(k) = quasi(k) + ytemp(j+1) * r;
      r = r / qs;

    end

  end
%
%  Update SEED.
%
  seed = seed + 1;

  return
end
