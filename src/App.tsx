import React from "react";
import templogo from "./temp_logo.png";
import "./App.css";

function App() {
  return (
    <div className="App">
      <div className="nav"> 홈 | 마이페이지 | 앨범 | 도장깨기</div>
      <img src={templogo} alt="temp" />
      <h1>Duo-Loft</h1>
      <h3> 커플이 되어 탈출하세요!</h3>
    </div>
  );
}

export default App;
