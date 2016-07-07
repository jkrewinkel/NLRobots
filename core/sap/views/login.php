<div id="container">
    <div id="hero">
        <h1>SAP Login</h1>
        <?php if( isset($params['error']) )
                echo '<div id="errors">' . $params['error']. '</div>'; ?>
        <form action="/sap/user/login" method="POST" id="login-form">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" />
            <label for="password">Password</label>
            <input type="password" name="password" id="password" />
            <button type="submit">Submit</button>
        </form>
    </div>
</div>