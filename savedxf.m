function savejmesh(node,face,elem,fname)
%
% savejmesh(node,face,elem,fname)
%
% save a mesh to jMesh format
%
% author: Qianqian Fang (fangq<at> nmr.mgh.harvard.edu)
% date: 2011/10/06
%
% input:
%      node: input, surface node list, dimension (nn,3)
%      face: input, surface face element list, dimension (be,3)
%      elem: input, tetrahedral element list, dimension (ne,4)
%      fname: output file name
%
% -- this function is part of iso2mesh toolbox (http://iso2mesh.sf.net)
%

if(nargin==2)
   fname=face;
   face=[];
end

if(nargin==3)
   fname=elem;
   elem=[];
end

fid=fopen(fname,'wt');
if(fid==-1)
    error('You do not have permission to save mesh files.');
end

mesh=struct('MeshNode',node,'MeshTri',face,'MeshTetra',elem,'CreateTime',datestr(now));
fpritnf(fid,'%s\n',savejson('',mesh));

fclose(fid);
