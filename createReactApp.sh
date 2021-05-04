# @author: Iresharma

# Color variables for color coding text
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ "$#" -ne 1 ]
then 
  echo "${RED}Please provide a project name! ❌${NC}"
  exit 1
fi

echo "${BLUE}Running create-react-app-v2 🚀${NC}"
npx create-react-app $1
cd "$1/"
npm install -S react-useanimations

# Moving into the react app directory
clear
echo "${YELLOW}Moving into the react app directory 📂${NC}"

# Deleting F up files
echo "${YELLOW}Deleting unwanted files 🗑${NC}"
rm -rf src/

# Making new src
echo "${YELLOW}Making src 💻${NC}"
mkdir src
cd src/

# Making required directories
echo "${YELLOW}Making required directories${NC}"
for i in "assets" "components" "pages" "css"
do
    mkdir $i
    echo "Created $i 📂"
done

# Moving assets
cp ../public/logo192.png ./assets/
cp ../public/logo512.png ./assets/

echo "${RED}Do you want webVitals and texts ?(y/N)${NC}"
read WEB_AND_TEST

if [ "$WEB_AND_TEST" = "y" ] || [ "$WEB_AND_TEST" = "Y" ] || [ "$WEB_AND_TEST" = "yes" ]; then
cat > reportWebVitals.js << EOF
const reportWebVitals = onPerfEntry => {
  if (onPerfEntry && onPerfEntry instanceof Function) {
    import('web-vitals').then(({ getCLS, getFID, getFCP, getLCP, getTTFB }) => {
      getCLS(onPerfEntry);
      getFID(onPerfEntry);
      getFCP(onPerfEntry);
      getLCP(onPerfEntry);
      getTTFB(onPerfEntry);
    });
  }
};

export default reportWebVitals;

EOF

cat > setupTests.js << EOF
// jest-dom adds custom jest matchers for asserting on DOM nodes.
// allows you to do things like:
// expect(element).toHaveTextContent(/react/i)
// learn more: https://github.com/testing-library/jest-dom
import '@testing-library/jest-dom';
EOF

# Index.js
echo "${YELLOW}Writing index.js${NC}"
cat > index.js << EOF
import React from "react";
import ReactDOM from "react-dom";
import "./css/index.css";
import App from "./App.jsx";
import reportWebVitals from "./reportWebVitals";

ReactDOM.render(<App />, document.getElementById("root"));


// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
EOF


else

# Index.js
echo "${YELLOW}Writing index.js${NC}"
cat > index.js << EOF
import React from "react";
import ReactDOM from "react-dom";
import "./css/index.css";
import App from "./App.jsx";

ReactDOM.render(<App />, document.getElementById("root"));
EOF
fi

# Creating footer component 
cd components/
cat > footer.jsx << EOF
import UseAnimations from "react-useanimations";
import github from "react-useanimations/lib/github"
import linkedin from "react-useanimations/lib/linkedin"
import instagram from "react-useanimations/lib/instagram"

const Footer = () => {
  const styles = {
    position: "fixed",
    bottom: 0,
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    backgroundColor: "black",
    height: "3vh",
    width: "100%",
    color: "white",
    paddingLeft: 5,
    paddingRight: 5,
  };
  return (
    <>
      <div style={styles}>
          <span>Made with 🧠 by Iresharma and buddies!</span>
          <span style={{display: 'flex'}}>
            <UseAnimations onClick={() => window.open('https://github.com/iresharma', '_blank')} animation={github} strokeColor="white" /> &nbsp;&nbsp;&nbsp;
            <UseAnimations onClick={() => window.open('https://www.linkedin.com/in/iresharma/', '_blank')} animation={linkedin} strokeColor="white" /> &nbsp;&nbsp;&nbsp;
            <UseAnimations onClick={() => window.open('https://www.instagram.com/iresharma.py/', '_blank')} animation={instagram} strokeColor="white" /> &nbsp;&nbsp;&nbsp;
          </span>
      </div>
    </>
  );
};

export default Footer;
EOF

cd ../

cd pages/
# Creating a page
cat > home.jsx << EOF
const Home = () => {
    return (
        <div class="body">
            <h1>
                Welcome to create-react-App 2.0 by <code><a href="https://github.com/iresharma">@Iresharma</a></code>
            </h1>
            <img src="https://cdn.dribbble.com/users/904433/screenshots/5705775/context_dribbble.png" alt="" />
        </div>
    );
}

export default Home;
EOF

cd ../../
echo `pwd`
echo "${RED}Want a react-router-dom ? (y/N)${NC}"
read ROUTER

# App.jsx
if [ "$ROUTER" = "y" ] || [ "$ROUTER" = "Y" ] || [ "$ROUTER" = "yes" ]; then
echo "${YELLOW}Working on router 🗺${NC}"
npm install react-router-dom
clear
cd src/
cd pages/

# Creating another page
cat > about.jsx << EOF
const About = () => {
    return <h1>This is about page</h1>;
};

export default About;
EOF

cd ../
mkdir router
cd router/
echo "${YELLOW}Writing router file${NC}"


cat > index.jsx << EOF
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Home from "../pages/home";
import About from "../pages/about";

const RouterView = () => {
  return (
    <>
      <Router>
        <Switch>
          <Route path="/" exact component={Home} />
          <Route path="/about" component={About} />
          {/* <Route path="*" component={Page404} /> */}
        </Switch>
      </Router>
    </>
  );
};

export default RouterView;
EOF

cd ../
echo "${YELLOW}Writing App.jsx${NC}"
cat > App.jsx << EOF


import RouterView from "./router";
import Footer from "./components/footer";

const App = () => {
  return (
    <>
      <RouterView />
      <Footer />
    </>
  );
}

export default App;
EOF


else

echo "${YELLOW}Writing App.jsx${NC}"

cat > App.jsx << EOF
import Home from "../pages/home"
import Footer from "../components/footer"

const App = () => {
    return (
        <>
            <Home />
            <Footer />
        </>
    )
}

export default App;
EOF

fi

cd css/
echo "${YELLOW}Writing CSS file 👩🏻‍🎨${NC}"
cat > index.css << EOF
* {
    margin: 0;
    padding: 0;
}
.body {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    height: 100vh;
}
a {
    text-decoration: none;
    color: #f3bccc;
}
h1 {
    font-family: Arial, Helvetica, sans-serif;
    font-size: 3em;
    font-weight: 700;
    color: #0DD3AC;
}
EOF

cd ../
echo "${RED}Include Firebase 🔥(y/N)${NC}"
read FIRE

if [ "$FIRE" = "y" ] || [ "$FIRE" = "Y" ] || [ "$FIRE" = "yes" ]; then
mkdir firebase
cd firebase/
cat > firebaseConfig.js << EOF
import firebase from "firebase";
import "firebase/firestore";

const firebaseConfig = {
  apiKey: process.env.REACT_APP_APIKEY,
  authDomain: process.env.REACT_APP_AUTH_DOMAIN,
  projectId: process.env.REACT_APP_PROJECT_ID,
  storageBucket: process.env.REACT_APP_STORAGE_BUCKET,
  messagingSenderId: process.env.REACT_APP_MESSAGE_SENDER_ID,
  appId: process.env.REACT_APP_APP_ID,
};
firebase.initializeApp(firebaseConfig);
const auth = firebase.auth();
const db = firebase.firestore();
const expo = { db, auth }

export default expo;
EOF

cd ../../
cat > .env << EOF
REACT_APP_APIKEY=
REACT_APP_AUTH_DOMAIN=
REACT_APP_PROJECT_ID=
REACT_APP_STORAGE_BUCKET=
REACT_APP_MESSAGE_SENDER_ID=
REACT_APP_APP_ID=
EOF
echo ".env" >> .gitignore
fi

echo "${GREEN}Remember to add all the firebase config details in .env file! ${NC}"

git add .
git commit -m "Made changes using create-react-app-v2 by Iresharma and buddies!🎉"

clear
echo "${GREEN}React app created${NC}"

npm start