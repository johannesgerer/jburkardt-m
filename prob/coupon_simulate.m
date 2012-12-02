function [ coupon, n_coupon, seed ] = coupon_simulate ( n_type, seed )

%*****************************************************************************80
%
%% COUPON_SIMULATE simulates the coupon collector's problem.
%
%  Discussion:
%
%    The coupon collector needs to collect one of each of N_TYPE
%    coupons.  The collector may draw one coupon on each trial,
%    and takes as many trials as necessary to complete the task.
%    On each trial, the probability of picking any particular type
%    of coupon is always 1 / N_TYPE.
%
%    The most interesting question is, what is the expected number
%    of drawings necessary to complete the collection?
%    how does this number vary as N_TYPE increases?  What is the
%    distribution of the numbers of each type of coupon in a typical
%    collection when it is just completed?
%
%    As N increases, the number of coupons necessary to be
%    collected in order to get a complete set in any simulation
%    strongly tends to the value N_TYPE * LOG ( N_TYPE ).
%
%    If N_TYPE is 1, the simulation ends with a single drawing.
%
%    If N_TYPE is 2, then we may call the coupon taken on the first drawing
%    a "Head", say, and the process then is similar to the question of the
%    length, plus one, of a run of Heads or Tails in coin flipping.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N_TYPE, the number of types of coupons.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer COUPON(N_TYPE), the number of coupons of each type
%    that were collected during the simulation.
%
%    Output, integer N_COUPON, the total number of coupons collected.
%
%    Output, integer SEED, a seed for the random number generator.
%
  max_coupon = 2000;

  coupon(1:n_type) = 0;

  straight = 0;
  n_coupon = 0;
%
%  Draw another coupon.
%
  while ( n_coupon < max_coupon )

    [ i, seed ] = i4_uniform ( 1, n_type, seed );
%
%  Increment the number of I coupons.
%
    coupon(i) = coupon(i) + 1;
    n_coupon = n_coupon + 1;
%
%  If I is the next one we needed, increase STRAIGHT by 1.
%
    if ( i == straight + 1 )

      while ( 1 )

        straight = straight + 1;
%
%  If STRAIGHT = N_TYPE, we have all of them.
%
        if ( n_type <= straight )
          return;
        end
%
%  If the next coupon has not been collected, our straight is over.
%
        if ( coupon(straight+1) <= 0 )
          break;
        end

      end

    end

  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'COUPON_SIMULATE - Fatal error!\n' );
  fprintf ( 1, '  Maximum number of coupons drawn without success.\n' );

  return
end
