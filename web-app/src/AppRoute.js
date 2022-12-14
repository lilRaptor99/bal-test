import {
  BrowserRouter as Router,
  Switch,
  Route,
} from "react-router-dom";

import Home from './pages/home';
import Menu from './pages/menu';
import CheckStatus from './pages/check-status';

const AppRoute = () => {
  return (
    <Router>
      <Switch>
        <Route exact path="/">
          <Home />
        </Route>
        <Route path="/menu">
          <Menu />
        </Route>
        <Route path="/check-status">
          <CheckStatus />
        </Route>
      </Switch>
    </Router>
  );
}

export default AppRoute;
