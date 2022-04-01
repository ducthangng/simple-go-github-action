import React, { useState, useEffect } from "react";

function GetRequestHooks() {
  const [user, setUser] = useState(null);

  useEffect(() => {
    // GET request using fetch inside useEffect React hook
    fetch("https://api.npms.io/v2/search?q=react")
      .then((response) => response.json())
      .then((data) => setUser(data.total));

    // empty dependency array means this effect will only run once (like componentDidMount in classes)
  }, [user, setUser]);

  return (
    <div className="card text-center m-3">
      <h5 className="card-header">GET Request with React Hooks</h5>
      <div className="card-body">Total react packages: {user}</div>
    </div>
  );
}

export default GetRequestHooks;
