
export const convertUriFormat = (uri) => {
    const cid = uri.replace("ipfs://", "");
    const convertedUri = `https://ipfs.io/ipfs/${cid}`;
    return convertedUri;
  };
  