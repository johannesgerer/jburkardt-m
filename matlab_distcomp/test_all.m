% Script to run a suite of test problems
% We have six test problems wherein the local Matlab client (possibly) uses
% the ithaca cluster with the Parallel Computing Toolbox

% The various test examples are in folders within the current directory

%%
clear all

local = pwd; addpath(local); 

%% md_wrap
% md_program runs a 'molecular dynamics' simulation and writes some results 
% to the the Command Window

 try
   fprintf(1,'\n \n Run the parallel MD example \n');
   cd('./john_md');
   nw = 4;
   results = md_wrap(nw);
% Show that we have retrieved results to the local workspace
   fprintf(1,'\n Final potential energy  %14f \n ',results{1}.pe(end))
   cd(local)
   clear all
   fprintf(1,'Results have been cleared \n')
 catch MD
     disp('Trouble with MD_WRAP')
     cd(local)
     MD %#ok
     MD.message
 end

 
%% systolic_ithaca
% systolic_ithaca creates and submits a job with a systolic array to filter
% an audio file. The job runs on ithaca.arc.vt.edu and requires a parallel
% configiguration file ithaca_2009b. 
% The original and the filtered files are played on the local machine
% (assuming it has speakers).

 local = pwd; 
 try
   fprintf(1,'\n \n Run the systolic array example \n');
   cd ./lyrics
   systolic_ithaca
   cd(local)
   clear all
 catch SYSTOLIC
     disp('Trouble with systolic_ithaca')
     cd(local)
     SYSTOLIC %#ok
 end
 
 
 
%% dist_knap
% dist_knap  creates a job with four tasks. Each task loops through
% a range of possible weight combinations to find those that sum to a given
% value

 local = pwd; 
 try
   fprintf(1,'\n \n Run the knapsack example \n');
   cd ./knap
   dist_knap
   cd(local)
   clear all
 catch KNAP
     disp('Trouble with dist_knap')
     cd(local)
     KNAP %#ok
 end
 
 
%% color_segmentation
% colorSegmentationSol2  creates a matlabpool and uses an spmd construct
% to extract parts of an image with a given color. This version creates
% several images on the cluster - these are a Composite variable on the
% local client. After running the filter we write a jpg file on the client.

 local = pwd; 
 try
   fprintf(1,'\n \n Run the color segmentation example \n');
   cd ./color_segmentation
   filteredImage=colorSegmentationSol2('ithaca');
   cd(local)
% Display some information about the result
   fprintf(1,'\n  The binary image files are referenced as a Composite variable on the client \n')
   fprintf(1,' We retrieve one of these (four) images to a jpeg file on the client \n');
   fprintf(1,' This could take awhile \n \n ');
% 
    jj = 3; % pick one
%  for jj=1:length(filteredImage)
    f_Image = filteredImage{jj};
    disp('size of the image array  ');  size(f_Image)
    imwrite( f_Image, ['fab_' int2str(jj) '.jpg'], 'jpg')
%  end
   fprintf(1,'Results have been written to the local directory \n');
   fprintf(1,'Now close the matlabpool \n');
   matlabpool close
   clear all
 catch COLOR
     disp('Trouble with color_segmentation')
     if matlabpool('size') > 0
        matlabpool close force ithaca_2009b
     end
     cd(local)
     COLOR %#ok
     COLOR.message
 end
 
  
%% birthday
% brunbirthday  creates a batch job that uses a matlabpool and a parfor
% construct. The job runs a number of realizations (Monte Carlo) to
% generate an estimate for the probability that at least two people in a
% group (or 30) have the same birthday.

 local = pwd; 
 try
   fprintf(1,'\n \n Run the birthday example \n');
   cd ./birthday
   nw = 4;
   prob = brunbirthday(nw)  %#ok
   cd(local)
   fprintf(1,'The brunbirthday script destroys the batch job \n');
   clear all
 catch BIRTH
     disp('Trouble with birthday')
     if matlabpool('size') > 0
        matlabpool close force ithaca_2009b
     end
     cd(local)
     BIRTH %#ok
     BIRTH.message
 end